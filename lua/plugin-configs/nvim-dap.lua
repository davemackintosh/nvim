require("nvim-dap-virtual-text").setup()

local dap = require "dap"

dap.adapters.lldb = {
	type = "executable",
	command = "/usr/bin/lldb-vscode-14",
	name = "lldb",
}
dap.adapters.go = function(callback, _config)
	vim.defer_fn(function()
		callback { type = "server", host = "127.0.0.1", port = "port" }
	end, 100)
end

dap.configurations.cpp = {
	{
		name = "Launch",
		type = "lldb",
		request = "launch",
		program = vim.fn.getcwd() .. "/target/debug/*",
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		args = {},
		runInTerminal = false,
	},
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

require("dap-go").setup {}

vim.cmd [[
	nnoremap <silent> <F5> :lua require"dap".continue()<CR>
	nnoremap <silent> <F8> :lua require"dap".step_over()<CR>
	nnoremap <silent> <F11> :lua require"dap".step_into()<CR>
	nnoremap <silent> <F12> :lua require"dap".step_out()<CR>
	nnoremap <silent> <leader>bp :lua require"dap".toggle_breakpoint()<CR>
	nnoremap <silent> <leader>bpc :lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>
]]
