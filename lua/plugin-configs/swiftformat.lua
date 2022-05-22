local M = {};
local Job = require 'plenary.job';
local cmd = vim.api.nvim_exec;

local get_buf_info = function()
	local pos = vim.fn.winsaveview()
	local winnr = vim.fn.winnr()
	return winnr, pos
end
local set_buf_lines = function(bufnr, content)
	if type(content) == "string" then
		content = vim.split(content, "\n")
	end

	vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, content)
	local _, pos = get_buf_info()
	vim.fn.winrestview(pos)
end

M.run = function()
	local buflines = vim.api.nvim_buf_get_lines(0, 0, -1, false)

	local args = {
		"--swiftversion",
		"5.4",
		"stdin",
		"--stdinpath",
		vim.api.nvim_buf_get_name(0),
	}

	local formatJob = Job:new({
		writer = table.concat(buflines, "\n"),
		command = "swiftformat",
		args = args,
		on_exit = vim.schedule_wrap(function(j, result)

			--- swiftformat return non-0 and that seems the only way to check for errors
			local stderr = j:stderr_result();
			vim.notify(table.concat(stderr, "\n"))
		end)
	})

	formatJob:sync();

	local new = formatJob:result();
	local bufnr = vim.api.nvim_get_current_buf();
	set_buf_lines(bufnr, new)
end

M.check_and_run_simulator = function()
	local function readfile(path)
		local file = io.open(path, "rb")
		if not file then return nil end
		local content = file:read "*a"
		file:close()
		return content
	end

	local cwd = vim.fn.getcwd()
	local package = readfile(cwd .. "/Package.swift")
	local scheme = string.match(package, [[name: "(%a+)"]])
	local bundleIdentifier = string.match(package, [[bundleIdentifier: "([%a.]+)"]])
	local bundleName = string.lower(scheme)
	local nvimBaseDir = string.gsub(os.getenv("MYVIMRC"), "(.*/)(.*)", "%1")

	if scheme == nil then
		vim.notify("Couldn't work out the right schema.", "error")
	else
		if bundleIdentifier == nil then
			vim.notify("Couldn't work out the bundle identifier", "error")
		else
			if bundleName == nil then
				vim.notify("Couldn't work out the bundle name")
			else
				vim.notify("running " .. scheme .. ":" .. bundleIdentifier .. ":Debug to " .. bundleName .. ".app")
			end
		end
	end

	local makeJob = Job:new({
		command = "make",
		args = {
			"-f",
			nvimBaseDir .. "collateral/SwiftPMMakefile",
			"run-iphone-debug"
		},
		env = {
			BUNDLE_NAME = bundleName,
			BUNDLE_IDENTIFIER = bundleIdentifier,
			XCODE_SCHEME = scheme,
		},
		on_exit = vim.schedule_wrap(function(j)
			local stderr = j:stderr_result();
			vim.notify(table.concat(stderr, "\n"))
		end)
	})

	makeJob:sync(50000)
end

M.on_attach = function()
	local mapx = require("mapx").setup()
	cmd("autocmd BufWritePost <buffer> :lua require 'plugin-configs.swiftformat'.run()", false)
	mapx.nnoremap("<C-e>", ":lua require 'plugin-configs.swiftformat'.check_and_run_simulator()<Cr>")
	-- cmd("autocmd BufWritePost *.swift :lua require 'plugin-configs.swiftformat'.check_and_run_simulator()", false)
end
return M
