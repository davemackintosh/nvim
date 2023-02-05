local M = {}
local Job = require "plenary.job"
local cmd = vim.api.nvim_exec
local loop = vim.loop

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

function M.format()
	local buflines = vim.api.nvim_buf_get_lines(0, 0, -1, false)

	local args = {
		"--swiftversion",
		"5.7",
		"stdin",
		"--stdinpath",
		vim.api.nvim_buf_get_name(0),
	}

	local formatJob = Job:new {
		writer = table.concat(buflines, "\n"),
		command = "swiftformat",
		args = args,
	}

	formatJob:sync()

	local new = formatJob:result()
	local bufnr = vim.api.nvim_get_current_buf()
	set_buf_lines(bufnr, new)
end

function M.build()
	Job:new({
		command = "swift",
		args = { "build" },
		on_exit = vim.schedule_wrap(function(j, exit_code)
			if exit_code ~= 0 then
				vim.notify("Build failed", vim.log.levels.ERROR)
				vim.notify(table.concat(j:result(), "\n"))
			else
				vim.notify(table.concat(j:result(), "\n"))
			end
		end),
	}):sync()
end

M.on_attach = function()
	-- On save, format the file.
	cmd(
		"autocmd BufWritePre *.swift :lua require 'plugin-configs.swiftformat'.format()",
		false
	)

	-- On save, build the project.
	cmd(
		"autocmd BufWritePost *.swift :lua require 'plugin-configs.swiftformat'.build()",
		false
	)
end

return M
