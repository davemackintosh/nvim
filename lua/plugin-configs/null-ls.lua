local nullls = require "null-ls"
local builtins = nullls.builtins

require "plugin-configs.diagnostic-window-styles"
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
		builtins.formatting.markdown_toc,
		builtins.formatting.mdformat,
		builtins.formatting.shellharden,
		builtins.formatting.swiftformat,
		builtins.formatting.yamlfmt,
	},
	on_attach = function()
		vim.cmd [[autocmd BufWritePost <buffer> lua vim.lsp.buf.format()]]
	end,
}

