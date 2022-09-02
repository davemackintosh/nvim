require("lspsaga").init_lsp_saga()
local nullls = require "null-ls"
local builtins = nullls.builtins

require("null-ls").setup {
	debug = true,
	sources = {
		-- Formatting.
		builtins.formatting.stylua,
		builtins.formatting.eslint_d,
		builtins.formatting.prettier,
		builtins.formatting.fixjson,
		builtins.formatting.black,
		builtins.formatting.clang_format,
		builtins.formatting.cmake_format,
		builtins.formatting.gofmt,
		builtins.formatting.gofumpt,
		builtins.formatting.goimports,
		builtins.formatting.goimports_reviser,
		builtins.formatting.golines,
		builtins.formatting.isort,
		builtins.formatting.ktlint,
		builtins.formatting.lua_format,
		builtins.formatting.markdown_toc,
		builtins.formatting.remark,
		builtins.formatting.mdformat,
		builtins.formatting.shellharden,
		builtins.formatting.swiftformat,
		builtins.formatting.yamlfmt,

		-- Diagnostics.
		builtins.diagnostics.eslint_d,
		builtins.diagnostics.tsc,
		builtins.diagnostics.yamllint,
		builtins.diagnostics.tidy,
		builtins.diagnostics.checkmake,
		builtins.diagnostics.cppcheck,
		builtins.diagnostics.editorconfig_checker.with {
			command = "editorconfig-checker",
		},
		builtins.diagnostics.flake8,
		builtins.diagnostics.mypy,
		builtins.diagnostics.mdl,
		builtins.diagnostics.glslc,
		builtins.diagnostics.golangci_lint,
		builtins.diagnostics.staticcheck,
		builtins.diagnostics.revive,
		builtins.diagnostics.jsonlint,
		builtins.diagnostics.luacheck,
		builtins.diagnostics.selene,
		builtins.diagnostics.markdownlint,

		-- Code actions.
		builtins.code_actions.eslint,
		builtins.code_actions.gitsigns,
		builtins.code_actions.refactoring,

		-- Completions.
		builtins.completion.spell,
	},
	on_attach = function()
		vim.cmd [[autocmd BufWritePost <buffer> lua vim.lsp.buf.format()]]
	end,
}
