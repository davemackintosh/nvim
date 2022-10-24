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
		"clangd",
		"cmake",
		"cssls",
		"cucumber_language_server",
		"emmet_ls",
		"eslint",
		"golangci_lint_ls",
		"gopls",
		"html",
		"jsonls",
		"sumneko_lua",
		"rust_analyzer",
		"stylelint_lsp",
		"svelte",
		"svlangserver",
		"taplo",
		"yamlls"
	},
}
