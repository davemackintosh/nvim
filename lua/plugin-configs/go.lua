require("go").setup({
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
})
require "lspconfig".gopls.setup({})

-- Run gofmt + goimport on save
vim.api.nvim_exec([[ autocmd BufWritePre *.go :silent! lua require('go.format').goimport() ]], false)

