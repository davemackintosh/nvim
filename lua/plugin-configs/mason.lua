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
	},
}

require("mason-lspconfig").setup_handlers {
	function(server_name)
		require("lspconfig")[server_name].setup {
			capabilities = capabilities,
		}
	end,
}
