require("mason").setup {
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
}
require("mason-lspconfig").setup {
	automatic_installation = true,
	ensure_installed = {
		"bashls",
		"cmake",
		"clangd",
		"diagnosticls",
		"dockerls",
		"efm",
		"golangci_lint_ls",
		"gopls",
		"graphql",
		"html",
		"jsonls",
		"jedi_language_server",
		"tsserver",
		"vimls",
		"yamlls",
	},
}
