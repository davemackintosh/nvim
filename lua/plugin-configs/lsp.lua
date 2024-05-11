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
local pattern = require("lspconfig.util").root_pattern

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

		-- Don't set the offset encoding for rust-analyzer as it doesn't
		-- support it.
		if server_name ~= "rust_analyzer" then
			capabilities.offsetEncoding = "utf-32"
		end

		lspconfig[server_name].setup {
			capabilities = capabilities,
			root_dir = function()
				return vim.fn.getcwd()
			end,
		}
	end,
}
