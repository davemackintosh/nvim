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

require("mason-lspconfig").setup_handlers {
	function(server_name)
		lspconfig[server_name].setup {}
	end,
}

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
	vim.lsp.handlers.hover, {
		border = _border
	}
)

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
	vim.lsp.handlers.signature_help, {
		border = _border
	}
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

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics, {
		float = { border = "rounded" },
	}
)
