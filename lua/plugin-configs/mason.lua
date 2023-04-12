require("mason-nvim-dap").setup {
	ensure_installed = {
		"delve",
		"codelldb",
		"cppdbg",
		"python",
	},
	automatic_setup = true,
}

require "plugin-configs.nvim-dap"
