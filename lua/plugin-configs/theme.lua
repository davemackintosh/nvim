require("material").setup {
	contrast_filetypes = { -- Specify which filetypes get the contrasted (darker) background
		"terminal", -- Darker terminal background
		"packer", -- Darker packer background
		"qf", -- Darker qf list background
	},
	contrast = {
		sidebars = true, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
		floating_windows = true, -- Enable contrast for floating windows
		line_numbers = false, -- Enable contrast background for line numbers
		sign_column = false, -- Enable contrast background for the sign column
		cursor_line = false, -- Enable darker background for the cursor line
		non_current_windows = false, -- Enable darker background for non-current windows
		popup_menu = false, -- Enable lighter background for the popup menu
	},
}
vim.g.material_style = "palenight"
vim.cmd [[ colorscheme material ]]
vim.api.nvim_set_keymap(
	"n",
	"<leader>mm",
	[[<Cmd>lua require('material.functions').toggle_style()<CR>]],
	{ noremap = true, silent = true }
)
