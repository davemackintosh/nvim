require("neodev").setup({
	-- add any options here, or leave empty to use the default settings
})
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
				did_attach = true
			end
		end,
		capatilities = lsp_defaults.capabilities,
		filetypes = { "swift", "objective-c", "objective-cpp" },
		root_dir = root_mkr,
	}
end

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.etljson = {
	install_info = {
		url = "https://github.com/davemackintosh/tree-sitter-etljson.git", -- local path or git repo
		files = { "src/parser.c" },                                  -- note that some parsers also require src/scanner.c or src/scanner.cc
		branch = "main",
		generate_requires_npm = true,                                -- if stand-alone parser without npm dependencies
		requires_generate_from_grammar = false,                      -- if folder contains pre-generated src/parser.c
	},
	filetype = "etljson",                                            -- if filetype does not match the parser name
}

vim.filetype.add {
	extension = {
		etljson = "etljson",
	},
}
