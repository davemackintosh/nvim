require("nvim-dap-virtual-text").setup()

local xmake = require "helpers.xmake"
local dap = require "dap"

dap.adapters.lldb = {
	type = 'executable',
	-- absolute path is important here, otherwise the argument in the `runInTerminal` request will default to $CWD/lldb-vscode
	command = '/usr/bin/lldb-vscode',
	name = "lldb"
}
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
				if vim.fn.input("Build before debugging? (y/n)") == "y" then
					vim.fn.system("xmake build")
				end
				local xmakeInfo, targets = xmake.getXMakeInfoAsTable()
				buildPath = string.format("%s/%s/%s/%s/%s", xmakeInfo.workingdir, xmakeInfo.buildir, xmakeInfo.plat,
					xmakeInfo.arch, xmakeInfo.mode)
			else -- Otherwise, use the default build path.
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

vim.cmd [[
	nnoremap <silent> <F5> :lua require"dap".continue()<CR>
	nnoremap <silent> <F8> :lua require"dap".step_over()<CR>
	nnoremap <silent> <F11> :lua require"dap".step_into()<CR>
	nnoremap <silent> <F12> :lua require"dap".step_out()<CR>
	nnoremap <silent> <leader>bp :lua require"dap".toggle_breakpoint()<CR>
	nnoremap <silent> <leader>bpc :lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>
]]
