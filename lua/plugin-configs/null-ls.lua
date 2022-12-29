local nullls = require "null-ls"
local builtins = nullls.builtins

require "plugin-configs.diagnostic-window-styles"
require("null-ls").setup {
	debug = true,
	sources = {
		builtins.diagnostics.cppcheck,
		builtins.diagnostics.selene,
		builtins.diagnostics.editorconfig_checker,
	},
	on_attach = function()
		vim.cmd [[autocmd BufWritePost <buffer> lua vim.lsp.buf.format()]]
	end,
}
