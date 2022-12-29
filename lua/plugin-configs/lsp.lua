require("mason").setup {
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
}
require("mason-lspconfig").setup {
	automatic_installation = true,
	ensure_installed = {
		"bashls",
		"cmake",
		"clangd",
		"diagnosticls",
		"dockerls",
		"efm",
		"golangci_lint_ls",
		"gopls",
		"graphql",
		"html",
		"jsonls",
		"jedi_language_server",
		"tsserver",
		"vimls",
		"yamlls",
	},
}

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(_, bufnr)
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set("n", "rn", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
end

local capabilities = require("cmp_nvim_lsp").default_capabilities(
	vim.lsp.protocol.make_client_capabilities()
)
capabilities.offsetEncoding = { "utf-16" }
require("mason-lspconfig").setup_handlers {
	function(server_name)
		local lspconfig = require "lspconfig"
		lspconfig[server_name].setup {
			on_attach = on_attach,
			capabilities = capabilities,
		}
	end,
}
