require("neodev").setup {}
local os = require "os"
local lspconfig = require "lspconfig"
local lsp_defaults = lspconfig.util.default_config
local pattern = require("lspconfig.util").root_pattern
local root_mkr = pattern ".git/"

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
		-- print(server_name, os.getenv("PREFIX"), vim.fn.getcwd(), root_mkr())
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

-- Setup swiftformat post write hook and sourcekit-lsp.
-- using xcrun as a check if we're on macos.
local did_attach = false
if vim.fn.executable "xcrun" == 1 then
	local swift = require "plugin-configs.swiftformat"
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
