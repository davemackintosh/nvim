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
		"lua-language-server",
		"vim-language-server",
		"gopls",
		"stylua",
		"shellcheck",
		"editorconfig-checker",
		"gofumpt",
		"golines",
		"golangci-lint",
		"gomodifytags",
		"gotests",
		"luacheck",
		"misspell",
		"revive",
		"staticcheck",
		"sumneko_lua",
		"prettierd",
		"eslint-lsp",
	},
}
