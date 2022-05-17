local null_ls = require "null-ls"

local function has(filename)
	return function()
		return vim.fn.executable(filename) == 1
	end
end

local lsp_formatting = function(bufnr)
	vim.lsp.buf.format {
		filter = function(clients)
			-- filter out clients that you don't want to use
			return vim.tbl_filter(function(client)
				return client.name ~= "gopls"
			end, clients)
		end,
		bufnr = bufnr,
	}
end

-- if you want to set up formatting on save, you can use this as a callback
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- add to your shared on_attach callback
local on_attach = function(client, bufnr)
	if client.supports_method "textDocument/formatting" then
		vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				lsp_formatting(bufnr)
			end,
		})
	end
end

null_ls.setup {
	sources = {
		-- General.
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.swiftformat,
		null_ls.builtins.diagnostics.checkmake,
		null_ls.builtins.diagnostics.cppcheck,
		null_ls.builtins.completion.luasnip,
		null_ls.builtins.diagnostics.gitlint,
		null_ls.builtins.completion.spell,
		null_ls.builtins.code_actions.refactoring,
		null_ls.builtins.diagnostics.editorconfig_checker,

		-- Javascript/TypeScript.
		null_ls.builtins.diagnostics.eslint,
		null_ls.builtins.code_actions.eslint,
		null_ls.builtins.formatting.prettier,
		null_ls.builtins.diagnostics.tsc,

		-- Golangci-lint.
		null_ls.builtins.formatting.gofmt,
		null_ls.builtins.formatting.gofumpt.with { condition = has "gofumpt" },
		null_ls.builtins.formatting.golines.with { condition = has "golines" },
		null_ls.builtins.diagnostics.golangci_lint.with {
			"run",
			"--fix=true",
			"--fast",
			"--out-format=json",
			"$DIRNAME",
			"--path-prefix",
			"$ROOT",
		},
	},
	on_attach = function(client, bufnr)
		on_attach(client, bufnr)
		vim.cmd "autocmd BufWritePre <buffer> lua vim.lsp.buf.format()"
	end,
}
