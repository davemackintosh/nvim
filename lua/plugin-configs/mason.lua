local capabilities = require("cmp_nvim_lsp").update_capabilities(
	vim.lsp.protocol.make_client_capabilities()
)

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

require("mason-lspconfig").setup_handlers {
	function(server_name)
		require("lspconfig")[server_name].setup {
			capabilities = capabilities,
		}
	end,
}
