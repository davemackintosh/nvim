require("mason").setup {}
require("mason-lspconfig").setup {}
require("mason-nvim-dap").setup {
	ensure_installed = {
		"delve",
		"codelldb",
		"cppdbg",
		"python",
	},
}
