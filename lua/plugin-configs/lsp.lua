require("lspsaga").init_lsp_saga()
local capabilities =
	require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.offsetEncoding = { "utf-16" }

local schemas = require("schemastore").json.schemas()
local servers = {
	golangci_lint_ls = {},
	gopls = {},
	bashls = {},
	clangd = {},
	diagnosticls = {},
	sumneko_lua = {
		settings = {
			Lua = {
				runtime = {
					version = "Lua5.1",
				},
				diagnostics = {
					globals = { "vim" },
				},
			},
		},
	},
	html = {},
	vimls = {},
	tsserver = {},
	pyright = {},
	graphql = {},
	eslint = require "plugin-configs.eslint",
	jedi_language_server = {},
	-- sourcekit = {},
	jsonls = {
		settings = {
			json = {
				schemas = schemas,
				validate = { enable = true },
			},
		},
	},
	yamlls = {
		settings = {
			yaml = {
				schemas = {
					["https://raw.githubusercontent.com/awslabs/goformation/v4.18.2/schema/cloudformation.schema.json"] = {
						"*.yaml",
						"*.yml",
					},
					["https://raw.githubusercontent.com/awslabs/goformation/master/schema/sam.schema.json"] = {
						"*.yaml",
						"*.yml",
					},
					["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
				},
			},
			schemaStore = {
				enable = true,
			},
		},
	},
}
local function on_attach(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	if client.name == "golangci_lint_ls" then
		if vim.fn.executable "golangci-lint-langserver" ~= 1 then
			vim.notify "Installing golangci-lint-langserver"
			vim.fn.system {
				"go",
				"install",
				"github.com/nametake/golangci-lint-langserver@latest",
			}
		end

		if vim.fn.executable "golangci-lint" ~= 1 then
			vim.notify "Installing golangci-lint"
			vim.fn.system {
				"go",
				"install",
				"github.com/nametake/golangci-lint@latest",
			}
		end
	end
	-- if you want to set up formatting on save, you can use this as a callback
	local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

	vim.api.nvim_create_autocmd("BufWritePre", {
		group = augroup,
		pattern = "*",
		callback = function()
			vim.lsp.buf.format()
		end,
	})

	-- Server capabilities spec:
	-- https://microsoft.github.io/language-server-protocol/specifications/lsp/3.17/specification/#serverCapabilities
	if client.server_capabilities.documentHighlightProvider then
		vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
		vim.api.nvim_clear_autocmds { buffer = bufnr, group = "lsp_document_highlight" }
		vim.api.nvim_create_autocmd("CursorHold", {
			callback = vim.lsp.buf.document_highlight,
			buffer = bufnr,
			group = "lsp_document_highlight",
			desc = "Document Highlight",
		})
		vim.api.nvim_create_autocmd("CursorMoved", {
			callback = vim.lsp.buf.clear_references,
			buffer = bufnr,
			group = "lsp_document_highlight",
			desc = "Clear All the References",
		})
	end
end

local commonOptions = {
	on_attach = on_attach,
}

for server_name, _ in pairs(servers) do
	local opts = vim.tbl_deep_extend("force", commonOptions, servers[server_name] or {})
	require("lspconfig")[server_name].setup(opts)
end
