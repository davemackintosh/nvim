require("nvim-tree").setup {
	disable_netrw = true,
	hijack_netrw = true,
	hijack_unnamed_buffer_when_opening = true,
	update_focused_file = {
		enable = true,
		update_cwd = false,
		ignore_list = { ".git/*" },
	},
	filters = {
		custom = { ".git/" },
		exclude = { ".gitignore" },
	},
	view = {
		float = {
			open_win_config = {
				border = "rounded"
			}
		}
	}
}

vim.cmd([[
hi NvimTreeNormal guibg=#050515
hi NvimTreeWinSeparator guibg=none guifg=#67F0AB
]])
