local lspconfig = require "lspconfig"
local lsp_defaults = lspconfig.util.default_config
local languages = require("efmls-configs.defaults").languages()

languages = vim.tbl_extend("force", languages, {
	go = {
		require "efmls-configs.linters.golangci_lint",
		require "efmls-configs.formatters.goimports",
	},
})

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
