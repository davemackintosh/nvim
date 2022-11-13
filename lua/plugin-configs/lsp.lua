local lspconfig = require "lspconfig"

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set("n", "rn", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
end

local capabilities = require("cmp_nvim_lsp").default_capabilities(
	vim.lsp.protocol.make_client_capabilities()
)

require("mason-lspconfig").setup_handlers {
	function(server_name)
		lspconfig[server_name].setup {
			on_attach = on_attach,
			capabilities = capabilities,
		}
	end,
}

-- Add the sourcekit lsp for swift.
local pattern = require("lspconfig.util").root_pattern
local root_mkr =
pattern("Package.swift", ".git", "project.yml", "Project.swift")
lspconfig.sourcekit.setup {
	on_attach = on_attach,
	capabilities = capabilities,
	cmd = { "xcrun", "sourcekit-lsp", "--log-level", "error" },
	filetypes = { "swift", "objective-c", "objective-cpp" },
	root_dir = root_mkr,
}
