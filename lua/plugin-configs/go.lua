require("go").setup {
	notify = true,
	auto_format = true,
	auto_lint = true,
	linter = "golangci-lint",
	formatter = "gofumpt",
	test_popup = true,
	-- lint_prompt_style = "vt",
	lsp_gofumpt = true,
	lsp_diag_update_in_insert = true,
	max_line_length = 100,
}

local mapx = require "mapx".setup {}
mapx.inoremap("<C-c>", "<cmd>:GoCoverage<Cr>")
mapx.nnoremap("<C-c>", "<cmd>:GoCoverage<Cr>")

-- Run gofmt + goimport on save
local augroup = vim.api.nvim_create_augroup("GoFormatting", {})
-- vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
vim.api.nvim_create_autocmd("BufWritePre", {
	group = augroup,
	pattern = "*.go",
	callback = function()
		require('go.format').goimport()
	end,
})
