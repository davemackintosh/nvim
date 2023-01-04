require("nvim-dap-virtual-text").setup()

local dap = require "dap"
dap.configurations.lua = {
	{
		type = "nlua",
		request = "attach",
		name = "Attach to running Neovim instance",
	},
}

dap.adapters.nlua = function(callback, config)
	callback { type = "server", host = config.host or "127.0.0.1", port = config.port or 8088 }
end

dap.adapters.cppdbg = {
	id = 'cppdbg',
	type = 'executable',
	command = '/home/dave/Downloads/extension/debugAdapters/bin/OpenDebugAD7',
}

dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "cppdbg",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopAtEntry = true,
  },
  {
    name = 'Attach to gdbserver :1234',
    type = 'cppdbg',
    request = 'launch',
    MIMode = 'gdb',
    miDebuggerServerAddress = 'localhost:1234',
    miDebuggerPath = '/usr/bin/gdb',
    cwd = '${workspaceFolder}',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
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
