local lspconfig = require "lspconfig"
local lsp_defaults = lspconfig.util.default_config

lsp_defaults.capabilities = vim.tbl_deep_extend(
	"force",
	lsp_defaults.capabilities,
	require("cmp_nvim_lsp").default_capabilities()
)

require("mason").setup {}
require("mason-lspconfig").setup {}

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

	-- Run format on save
	vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
end

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
			on_attach = on_attach,
		}
	end,
}

-- Setup swiftformat post write hook and sourcekit-lsp.
-- using xcrun as a check if we're on macos.
local did_attach = false
if vim.fn.executable "xcrun" == 1 then
	local swift = require "plugin-configs.swiftformat"
	local pattern = require("lspconfig.util").root_pattern
	local root_mkr =
		pattern("Package.swift", ".git", "project.yml", "Project.swift")
	lspconfig.sourcekit.setup {
		on_attach = function(a, b)
			if not did_attach then
				swift.on_attach()
				on_attach(a, b)
				did_attach = true
			end
		end,
		capatilities = lsp_defaults.capabilities,
		filetypes = { "swift", "objective-c", "objective-cpp" },
		root_dir = root_mkr,
	}
end
