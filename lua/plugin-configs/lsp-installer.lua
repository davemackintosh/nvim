local capabilities = require("cmp_nvim_lsp").update_capabilities(
	vim.lsp.protocol.make_client_capabilities()
)
local lsp_installer_servers = require "nvim-lsp-installer.servers"

local servers = {
	golangci_lint_ls = {},
	gopls = {
		capabilities = capabilities,
		filetypes = { "go", "gomod" },
		settings = {
			gopls = {
				usePlaceholders = false,
				buildFlags = {},
				gofumpt = true,
			},
		},
		init_options = {
			buildFlags = {},
		},
	},
	html = {},
	ccls = {},
	vimls = {},
	tsserver = {},
	yamlls = {
		yaml = {
			schemas = {
				["https://raw.githubusercontent.com/awslabs/goformation/v4.18.2/schema/cloudformation.schema.json"] = "*.yaml",
			},
		},
		schemaStore = {
			enable = true,
		},
	},
}
local options = {
	on_attach = on_attach,
	capabilities = capabilities,
	flags = {
		debounce_text_changes = 150,
	},
}

for server_name, _ in pairs(servers) do
	local server_available, server = lsp_installer_servers.get_server(server_name)

	if server_available then
		require("lspconfig")[server_name].setup {}
		server:on_ready(function()
			local opts = vim.tbl_deep_extend("force", options, servers[server.name] or {})
			server:setup(opts)
		end)

		if not server:is_installed() then
			print("Installing " .. server.name)
			server:install()
		end
	else
		print(server_name .. " not available")
	end
end
