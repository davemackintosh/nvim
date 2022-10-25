require("material").setup {
	contrast = {
		terminal = true, -- Enable contrast for the built-in terminal
		sidebars = true, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
		floating_windows = true, -- Enable contrast for floating windows
		cursor_line = false, -- Enable darker background for the cursor line
		non_current_windows = false, -- Enable darker background for non-current windows
		filetypes = {
			"packer", -- Enable contrast for packer
			"qf", -- Enable contrast for the quickfix windows
			"help", -- Enable contrast for the help windows
			"terminal", -- Enable contrast for the terminal windows
			"dashboard", -- Enable contrast for the dashboard windows
			"fugitive", -- Enable contrast for the fugitive windows
			"gitcommit", -- Enable contrast for the gitcommit windows
			"DAP Scopes", -- Enable contrast for the DAP Scopes windows
			"DAP UI", -- Enable contrast for the DAPui windows
			"DAP Breakpoints", -- Enable contrast for the DAP Breakpoints windows
			"[dap-repl]", -- Enable contrast for the DAP Repl windows
			"Scratch", -- Enable contrast for the Scratch windows
		}, -- Specify which filetypes get the contrasted (darker) background
	},
	plugins = { -- Uncomment the plugins that you use to highlight them
		-- Available plugins:
		"dap",
		-- "dashboard",
		"gitsigns",
		-- "hop",
		-- "indent-blankline",
		-- "lspsaga",
		-- "mini",
		-- "neogit",
		"nvim-cmp",
		-- "nvim-navic",
		"nvim-tree",
		-- "sneak",
		"telescope",
		"trouble",
		"which-key",
	},
	lualine_style = "default"
}
vim.g.material_style = "palenight"
vim.cmd [[ colorscheme material ]]
vim.api.nvim_set_keymap(
	"n",
	"<leader>mm",
	[[<Cmd>lua require("material.functions").toggle_style()<CR>]],
	{ noremap = true, silent = true }
)
