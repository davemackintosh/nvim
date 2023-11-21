local lspconfig = require "lspconfig"
local lsp_defaults = lspconfig.util.default_config
local languages = require("efmls-configs.defaults").languages()

local efmls_config = {
	filetypes = vim.tbl_keys(languages),
	settings = {
		rootMarkers = { ".git/" },
		languages = languages,
	},
	init_options = {
		documentFormatting = true,
		documentRangeFormatting = true,
	},
}

require("lspconfig").efm.setup(vim.tbl_extend("force", efmls_config, {
	capabilities = capabilities,
}))
