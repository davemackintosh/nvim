return {
	-- Editor support.
	-- The next few plugins are really the IDE feel.
	"wbthomason/packer.nvim",
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate", -- :MasonUpdate updates registry contents
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

	{ "folke/neodev.nvim", opts = {} },

	{
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup {
				highlight = {
					enable = true,
					auto_install = true,
				},
			}
		end,
	},
	{
		"ThePrimeagen/refactoring.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
		config = function()
			require "plugin-configs.refactoring"
		end,
	},
	"editorconfig/editorconfig-vim",
	{
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		version = "1.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!).
		build = "make install_jsregexp",
	},
	"luochen1990/rainbow",
	{
		"hrsh7th/nvim-cmp",
		config = function()
			require "plugin-configs.cmp"
		end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"hrsh7th/cmp-nvim-lsp",
			"onsails/lspkind-nvim",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-nvim-lsp-document-symbol",
		},
	},
	"lbrayner/vim-rzip",
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
	{
		"kosayoda/nvim-lightbulb",
		dependencies = "antoinemadec/FixCursorHold.nvim",
		config = function()
			require("nvim-lightbulb").setup { autocmd = { enabled = true } }
		end,
	},
	-- Window management
	{
		"aserowy/tmux.nvim",
		config = function()
			require "plugin-configs.tmux"
		end,
	},
	--	{
	--		"akinsho/bufferline.nvim",
	--		dependencies = "kyazdani42/nvim-web-devicons",
	--		config = function() require "plugin-configs.bufferline" end,
	--	},

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
	{
		"github/copilot.vim",
		config = function()
			vim.g.copilot_filetypes = {
				["*"] = false,
				["bash"] = true,
				["go"] = true,
				["typescript"] = true,
				["javascript"] = true,
				["typescriptreact"] = true,
				["javascriptreact"] = true,
				["rust"] = true,
				["python"] = true,
				["lua"] = true,
				["c"] = true,
				["cpp"] = true,
				["swift"] = true,
				["vim"] = true,
			}
		end,
	},
	"sebdah/vim-delve",
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
	"vim-test/vim-test",

	-- Visual.
	{
		"yamatsum/nvim-nonicons",
		dependencies = { "kyazdani42/nvim-web-devicons" },
	},
	"ap/vim-css-color",
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
			"nvim-telescope/telescope-packer.nvim",
			"nvim-telescope/telescope-dap.nvim",
		},
		config = function()
			require "plugin-configs.telescope"
		end,
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
	--			vim.cmd [[
	--				colorscheme catppuccin_mocha
	--				hi Normal guibg=NONE ctermbg=NONE
	--			]]
	--		end,
	--	},
	{
		"marko-cerovac/material.nvim",
		config = function()
			require "plugin-configs.theme"
			vim.cmd [[
				colorscheme material
				hi Normal guibg=NONE ctermbg=NONE
			]]
		end,
	},

	-- Debugging
	"mfussenegger/nvim-dap",
	"leoluz/nvim-dap-go",
	{
		"rcarriga/nvim-dap-ui",
		config = function()
			require "plugin-configs.nvim-dap-gui"
		end,
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		config = function()
			require "plugin-configs.mason"
		end,
	},
	"theHamsta/nvim-dap-virtual-text",
	"jbyuki/one-small-step-for-vimkind",
}
