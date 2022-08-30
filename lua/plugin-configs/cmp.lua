-- From https://raw.githubusercontent.com/alpha2phi/neovim-for-beginner/11-lsp/lua/config/cmp.lua
local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0
		and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
end

local luasnip = require "luasnip"
local cmp = require "cmp"

cmp.setup {
	completion = { completeopt = "menu,menuone,noinsert", keyword_length = 3 },
	experimental = { native_menu = false, ghost_text = false },
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	formatting = {
		format = require("lspkind").cmp_format {
			with_text = true,
			maxwidth = 50,
			menu = {
				nvim_lsp = "[LSP]",
				buffer = "[Buffer]",
				luasnip = "[Snip]",
				nvim_lua = "[Lua]",
				treesitter = "[Treesitter]",
				path = "[Path]",
			},
		},
	},
	mapping = {
		["<Up>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
		["<Down>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
		["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		["<Esc>"] = cmp.mapping { i = cmp.mapping.close(), c = cmp.mapping.close() },
		["<CR>"] = cmp.mapping.confirm {
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		},
		--		["<Tab>"] = cmp.mapping(function(fallback)
		--			if cmp.visible() then
		--				cmp.select_next_item()
		--			elseif luasnip.expand_or_jumpable() then
		--				luasnip.expand_or_jump()
		--			elseif has_words_before() then
		--				cmp.complete()
		--			else
		--				fallback()
		--			end
		--		end, {
		--			"i",
		--			"s",
		--			"c",
		--		}),
		--		["<S-Tab>"] = cmp.mapping(function(fallback)
		--			if cmp.visible() then
		--				cmp.select_prev_item()
		--			elseif luasnip.jumpable(-1) then
		--				luasnip.jump(-1)
		--			else
		--				fallback()
		--			end
		--		end, {
		--			"i",
		--			"s",
		--			"c",
		--		}),
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "treesitter" },
		{ name = "buffer" },
		{ name = "luasnip" },
		{ name = "nvim_lua" },
		{ name = "path" },
		{ name = "nvim_lsp_signature_help" },
		{ name = "spell" },
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
}

-- Use buffer source for `/`
cmp.setup.cmdline("/", {
	sources = {
		{ name = "buffer" },
	},
})

-- Use cmdline & path source for ':'
cmp.setup.cmdline(":", {
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})

-- Auto pairs
local cmp_autopairs = require "nvim-autopairs.completion.cmp"
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })
