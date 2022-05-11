local capabilities = require "cmp_nvim_lsp".update_capabilities(
	vim.lsp.protocol.make_client_capabilities()
)

local servers = {
  gopls = {},
  html = {},
  jsonls = {},
	ccls = {},
  sumneko_lua = {},
  tsserver = {},
  vimls = {},
}

local function on_attach(_, bufnr)
	local saga = require 'lspsaga'

  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Use LSP as the handler for formatexpr.
  -- See `:help formatexpr` for more information.
  vim.api.nvim_buf_set_option(0, "formatexpr", "v:lua.vim.lsp.formatexpr()")

	saga.init_lsp_saga()
end

local opts = {
  on_attach = on_attach,
	capabilities = capabilities,
  flags = {
    debounce_text_changes = 150,
  },
}

require "plugin-configs/lsp-installer".setup(servers, opts)

