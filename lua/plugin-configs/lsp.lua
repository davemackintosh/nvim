require("lspsaga").init_lsp_saga()
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
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
	vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
	vim.keymap.set("n", "<space>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
	vim.keymap.set("n", "<space>f", vim.lsp.buf.formatting, bufopts)
end

local lsp_flags = {
	-- This is the default in Nvim 0.7+
	debounce_text_changes = 150,
}
local servers = {
	"eslint",
	"clangd",
	"cmake",
	"diagnosticls",
	"golangci_lint_ls",
	"gopls",
	"graphql",
	"html",
	"jsonls",
	"pyright",
	"sourcery",
	"stylelint_lsp",
	"tsserver",
	"vimls",
	"yamlls",
}

for _, server in pairs(servers) do
	lspconfig[server].setup {
		on_attach = on_attach,
		flags = lsp_flags,
	}
end

--local nullls = require "null-ls"
--local builtins = nullls.builtins
--
--require "plugin-configs.diagnostic-window-styles"
--require("null-ls").setup {
--	debug = true,
--	sources = {
--		-- Formatting.
--		builtins.formatting.stylua,
--		builtins.formatting.eslint_d,
--		builtins.formatting.prettier,
--		builtins.formatting.fixjson,
--		builtins.formatting.black,
--		builtins.formatting.clang_format,
--		builtins.formatting.cmake_format,
--		builtins.formatting.gofmt,
--		builtins.formatting.gofumpt,
--		builtins.formatting.goimports,
--		builtins.formatting.goimports_reviser,
--		builtins.formatting.golines,
--		builtins.formatting.isort,
--		builtins.formatting.ktlint,
--		builtins.formatting.markdown_toc,
--		builtins.formatting.mdformat,
--		builtins.formatting.shellharden,
--		builtins.formatting.swiftformat,
--		builtins.formatting.yamlfmt,
--
--		-- Diagnostics.
--		builtins.diagnostics.eslint_d,
--		builtins.diagnostics.tsc,
--		builtins.diagnostics.yamllint,
--		builtins.diagnostics.tidy,
--		builtins.diagnostics.checkmake,
--		builtins.diagnostics.cppcheck,
--		builtins.diagnostics.editorconfig_checker.with {
--			command = "editorconfig-checker",
--		},
--		builtins.diagnostics.flake8,
--		builtins.diagnostics.mypy,
--		builtins.diagnostics.mdl,
--		builtins.diagnostics.glslc,
--		builtins.diagnostics.golangci_lint,
--		builtins.diagnostics.staticcheck,
--		builtins.diagnostics.revive,
--		builtins.diagnostics.jsonlint,
--		builtins.diagnostics.selene, -- Code actions.
--		builtins.code_actions.eslint,
--		builtins.code_actions.gitsigns,
--		builtins.code_actions.refactoring, -- Completions.
--		builtins.completion.spell,
--	},
--	on_attach = function()
--		vim.cmd [[autocmd BufWritePost <buffer> lua vim.lsp.buf.format()]]
--	end,
--}
