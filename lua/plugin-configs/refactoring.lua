require("refactoring").setup {
	-- prompt for return type
	prompt_func_return_type = {
		go = true,
		cpp = true,
		c = true,
		java = true,
	},
	-- prompt for function parameters
	prompt_func_param_type = {
		go = true,
		cpp = true,
		c = true,
		java = true,
	},
}

-- load refactoring Telescope extension
require("telescope").load_extension "refactoring"

-- remap to open the Telescope refactoring menu in visual mode
vim.api.nvim_set_keymap(
	"n",
	"gr",
	"<Esc><cmd>lua require('refactoring').refactor('Inline Variable')<CR>",
	{ noremap = true }
)
vim.api.nvim_set_keymap(
	"v",
	"gr",
	"<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>",
	{ noremap = true }
)
