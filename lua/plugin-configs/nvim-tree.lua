require("nvim-tree").setup {
	disable_netrw = true,
	hijack_netrw = true,
	open_on_setup = true,
	hijack_unnamed_buffer_when_opening = true,
	ignore_buffer_on_setup = false,
	update_focused_file = {
		enable = true,
		update_cwd = false,
		ignore_list = { ".git/*" },
	},
	filters = {
		custom = { ".git/" },
		exclude = { ".gitignore" },
	},
}

vim.cmd "autocmd Colorscheme * highlight NvimTreeNormal bg=#21252B fg=#9da5b3"
