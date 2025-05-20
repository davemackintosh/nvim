local lspconfig = require "lspconfig"
local lsp_defaults = lspconfig.util.default_config
local _border = "rounded"

require("mason").setup {
	ui = {
		border = _border
	}
}
local ensure_installed = { "lua_ls" }
if not vim.fn.has("android") then
	table.insert(ensure_installed, "rust_analyzer")
end
require("mason-lspconfig").setup {
	ensure_installed = ensure_installed
}

lsp_defaults.capabilities = vim.tbl_deep_extend(
	"force",
	lsp_defaults.capabilities,
	require("cmp_nvim_lsp").default_capabilities()
)


vim.diagnostic.config {
	float = { border = _border }
}

vim.diagnostic.config({
	virtual_text = {
		source = "if_many",
	},
	float = {
		source = "if_many",
	},
})
