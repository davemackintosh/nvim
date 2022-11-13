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
		"cssls",
		"diagnosticls",
		"dockerls",
		"efm",
		"emmet_ls",
		"golangci_lint_ls",
		"gopls",
		"graphql",
		"html",
		"jsonls",
		"sumneko_lua",
		"jedi_language_server",
		"rust_analyzer",
		"svelte",
		"tsserver",
		"lemminx",
		"vimls",
		"yamlls",
	},
}
