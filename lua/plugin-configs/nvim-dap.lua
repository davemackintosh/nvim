require("nvim-dap-virtual-text").setup()

local xmake = require "helpers.xmake"
local dap = require "dap"

dap.adapters.lldb = {
	type = 'executable',
	-- absolute path is important here, otherwise the argument in the `runInTerminal` request will default to $CWD/lldb-vscode
	command = '/usr/bin/lldb-vscode',
	name = "lldb"
}
dap.adapters.go = function(callback, config)
	-- Wait for delve to start
	vim.defer_fn(function()
			callback({ type = "server", host = "127.0.0.1", port = "port" })
		end,
		100)
end

dap.configurations.cpp = {
	{
		name = "Launch",
		type = "lldb",
		request = "launch",
		program = function()
			local buildPath = ""
			-- See if there is an xmake.lua file in the current directory.
			-- If there is, use the xmake helpers.
			if vim.fn.filereadable("xmake.lua") == 1 then
				if vim.fn.input("Build before debugging? (y/N)") == "y" then
					-- Run xmake build and check for errors.
					local output = vim.fn.system { "xmake", "build" }
					if vim.api.nvim_get_vvar("shell_error") ~= 0 then
						vim.notify(output, vim.log.levels.ERROR, {
							title = "xmake build failed",
							on_open = function(win)
								local buf = vim.api.nvim_win_get_buf(win)
								vim.api.nvim_buf_set_option(buf, "filetype", "cpp")
							end,
						})

						-- Close the dapui window if it is open, waiting for
						-- a couple of seconds to make sure the notification
						-- is displayed.
						vim.defer_fn(function()
							require "dapui".close()
						end, 1000)

						return ""
					end
				end
				local xmakeInfo, targets = xmake.getXMakeInfoAsTable()
				buildPath = string.format("%s/%s/%s/%s/%s", xmakeInfo.workingdir, xmakeInfo.buildir, xmakeInfo.plat,
					xmakeInfo.arch, xmakeInfo.mode)
			else
				-- Otherwise, use the default build path.
				buildPath = vim.fn.input('Build path: ', vim.fn.getcwd() .. '/build/', 'file')
			end

			-- return the path to the executable.
			return vim.fn.input('Path to executable: ', buildPath .. '/', 'file')
		end,
		cwd = '${workspaceFolder}',
		stopOnEntry = false,
		args = {},
		runInTerminal = false,
	},
}

dap.configurations.c = dap.configurations.cpp

require("dap-go").setup {}

vim.cmd [[
	nnoremap <silent> <F5> :lua require"dap".continue()<CR>
	nnoremap <silent> <F8> :lua require"dap".step_over()<CR>
	nnoremap <silent> <F11> :lua require"dap".step_into()<CR>
	nnoremap <silent> <F12> :lua require"dap".step_out()<CR>
	nnoremap <silent> <leader>bp :lua require"dap".toggle_breakpoint()<CR>
	nnoremap <silent> <leader>bpc :lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>
]]
