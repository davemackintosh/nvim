return {
	-- Editor support.
	-- The next few plugins are really the IDE feel.
	{
		"williamboman/mason.nvim",
		run = ":MasonUpdate", -- :MasonUpdate updates registry contents
	},
	"williamboman/mason-lspconfig.nvim",
	{
		"neovim/nvim-lspconfig",
		config = function()
			require "plugin-configs.lsp"
		end,
	},
	"ray-x/lsp_signature.nvim",
	"onsails/lspkind.nvim",
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require "plugin-configs.noice"
		end,
	},

	{
		"folke/neodev.nvim",
		config = function()
			require("neodev").setup()
		end
	},

	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("nvim-treesitter.configs").setup {
				highlight = true,
				enable = true,
				auto_install = true,
				rainbow = {
					enable = true,
					extended_mode = true,
					max_file_lines = nil,
				}
			}
		end,
	},
	"editorconfig/editorconfig-vim",
	{
		'codota/tabnine-nvim',
		build = "./dl_binaries.sh",
		config = function()
			require('tabnine').setup({
				disable_auto_comment = true,
				accept_keymap = "<Tab>",
				dismiss_keymap = "<C-]>",
				debounce_ms = 800,
				suggestion_color = { gui = "#808080", cterm = 244 },
				exclude_filetypes = { "TelescopePrompt", "NvimTree" },
				log_file_path = nil, -- absolute path to Tabnine log file
			})
		end
	},
	{
		"hrsh7th/nvim-cmp",
		config = function()
			require "plugin-configs.cmp"
		end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"hrsh7th/cmp-nvim-lsp",
			"onsails/lspkind-nvim",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-nvim-lsp-document-symbol",
		},
	},
	{
		"b0o/mapx.nvim",
		config = function()
			require "keyboard-mappings"
		end,
	},
	{
		"folke/trouble.nvim",
		config = function()
			require "plugin-configs.trouble"
		end,
	},
	"f-person/git-blame.nvim",
	"lewis6991/gitsigns.nvim",
	{
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup {}
		end,
	},
	{
		"weilbith/nvim-code-action-menu",
		cmd = "CodeActionMenu",
	},
	-- Window management
	{
		"aserowy/tmux.nvim",
		config = function()
			require "plugin-configs.tmux"
		end,
	},

	-- File management.
	{
		"kyazdani42/nvim-tree.lua",
		dependencies = {
			"kyazdani42/nvim-web-devicons",
		},
		config = function()
			require "plugin-configs.nvim-tree"
		end,
	},

	-- Code helpers.
	"sebdah/vim-delve",
	{
		'mrcjkb/rustaceanvim',
		version = '^4', -- Recommended
		lazy = false, -- This plugin is already lazy
	},
	{
		"windwp/nvim-autopairs",
		config = function()
			require "plugin-configs.autopairs"
		end,
	},
	"tpope/vim-endwise",
	"tpope/vim-fugitive",
	{
		"simrat39/symbols-outline.nvim",
		config = function()
			require("symbols-outline").setup()
		end,
	},
	"tpope/vim-surround",

	-- Visual.
	{
		"yamatsum/nvim-nonicons",
		dependencies = { "kyazdani42/nvim-web-devicons" },
	},
	{
		"glepnir/galaxyline.nvim",
		branch = "main",
		config = function()
			require "plugin-configs.galaxyline"
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-dap.nvim",
		},
		config = function()
			require "plugin-configs.telescope"
		end,
	},
	{
		"ldelossa/nvim-dap-projects",
		config = function()
			require("nvim-dap-projects").search_project_config()
		end
	},
	{
		"goolord/alpha-nvim",
		alpha = false,
		config = function()
			require("plugin-configs.dashboard").setup()
		end,
	},
	{
		"rcarriga/nvim-notify",
		config = function()
			local notify = require "notify"
			notify.setup {
				background_colour = "#000000",
			}
			vim.notify = notify
		end,
	},
	--	{
	--		"catppuccin/vim",
	--		config = function()
	--			vim.cmd [[colorscheme catppuccin_mocha]]
	--		end,
	--	},
	{
		"webhooked/norrsken.nvim",
		config = function()
			local norrsken = require("norrsken")
			norrsken.setup({
				-- show the '~' characters after the end of buffers
				show_end_of_buffer = true, -- default false
				-- use transparent background
				transparent_bg = true, -- default false
				-- set italics
				italics = {
					comments = true, -- default false
					keywords = true, -- default false
				},
				-- You can use overrides as table like this
				-- overrides = {
				--   NonText = { fg = "white" }, -- set NonText fg to white
				--   NvimTreeIndentMarker = { link = "NonText" }, -- link to NonText highlight
				--   Nothing = {} -- clear highlight of Nothing
				-- },
				-- Or you can also use it like a function to get color from theme
				-- overrides = function (colors)
				--   return {
				--     NonText = { fg = colors.white }, -- set NonText fg to white of theme
				--   }
				-- end,
			})

			vim.cmd [[colorscheme norrsken]]
		end
	},

	-- Debugging
	{
		"mfussenegger/nvim-dap",
		config = function()
			require "plugin-configs.nvim-dap"
		end
	},
	"leoluz/nvim-dap-go",
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"nvim-neotest/nvim-nio"
		},
		config = function()
			require "plugin-configs.nvim-dap-gui"
		end,
	},
	"theHamsta/nvim-dap-virtual-text",
	"jbyuki/one-small-step-for-vimkind",
}
