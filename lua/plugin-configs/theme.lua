require("material").setup()
vim.g.material_style = "palenight"
vim.cmd [[ colorscheme material ]]
vim.api.nvim_set_keymap(
	"n",
	"<leader>mm",
	[[<Cmd>lua require('material.functions').toggle_style()<CR>]],
	{ noremap = true, silent = true }
)
