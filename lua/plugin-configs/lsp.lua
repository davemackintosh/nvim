require("neodev").setup {
	library = {
		enabled = true,
		runtime = true,
		types = true,
		plugins = true,
		-- you can also specify the list of plugins to make available as a workspace library
		-- plugins = { "nvim-treesitter", "plenary.nvim", "telescope.nvim" },
	},
	setup_jsonls = true,
}
local lspconfig = require "lspconfig"
local lsp_defaults = lspconfig.util.default_config

local _border = {
	{ "🭽", "FloatBorder" },
	{ "▔", "FloatBorder" },
	{ "🭾", "FloatBorder" },
	{ "▕", "FloatBorder" },
	{ "🭿", "FloatBorder" },
	{ "▁", "FloatBorder" },
	{ "🭼", "FloatBorder" },
	{ "▏", "FloatBorder" },
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

lsp_defaults.capabilities = vim.tbl_deep_extend(
	"force",
	lsp_defaults.capabilities,
	require("cmp_nvim_lsp").default_capabilities()
)

require("mason").setup {}
require("mason-lspconfig").setup {}

local function cloneTable(t)
	local t2 = {}
	for k, v in pairs(t) do
		t2[k] = v
	end
	return t2
end

require("mason-lspconfig").setup_handlers {
	function(server_name)
		local capabilities = cloneTable(lsp_defaults.capabilities)

		lspconfig[server_name].setup {
			handlers = vim.lsp.handlers,
			capabilities = capabilities,
			root_dir = function()
				return vim.fn.getcwd()
			end,
		}
	end,
}
