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
		"bash-language-server",
		"editorconfig-checker",
		"eslint-lsp",
		"gofumpt",
		"golines",
		"golangci-lint",
		"gomodifytags",
		"gopls",
		"gotests",
		"luacheck",
		"lua-language-server",
		"misspell",
		"prettierd",
		"revive",
		"stylua",
		"shellcheck",
		"staticcheck",
		"typescript-language-server",
		"sumneko_lua",
		"vim-language-server",
	},
}
