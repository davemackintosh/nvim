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

vim.cmd [[
	nnoremap <silent> <F5> :lua require"dap".continue()<CR>
	nnoremap <silent> <F8> :lua require"dap".step_over()<CR>
	nnoremap <silent> <F11> :lua require"dap".step_into()<CR>
	nnoremap <silent> <F12> :lua require"dap".step_out()<CR>
	nnoremap <silent> <leader>bp :lua require"dap".toggle_breakpoint()<CR>
	nnoremap <silent> <leader>bpc :lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>
]]
