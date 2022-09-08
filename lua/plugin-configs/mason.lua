require("mason").setup {}
require("mason-lspconfig").setup {
	automatic_installation = true,
}
require("mason-tool-installer").setup {
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
	},
}

vim.api.nvim_create_autocmd("User", {
	pattern = "MasonToolsUpdateCompleted",
	callback = function()
		vim.schedule(vim.notify "mason-tool-installer has finished")
	end,
})
