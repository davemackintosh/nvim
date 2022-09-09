local fn = vim.fn
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
local packer_bootstrap

if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system {
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	}
end

return require("packer").startup(function(use)
	-- Editor support.
	use "gpanders/editorconfig.nvim"
	use {
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	}
	use {
		"neovim/nvim-lspconfig",
		config = [[ require "plugin-configs.lsp" ]],
		requires = {
			"ray-x/lsp_signature.nvim",
			"onsails/lspkind.nvim",
			"tami5/lspsaga.nvim",
			"alexaandru/nvim-lspupdate",
		},
	}
	use { "L3MON4D3/LuaSnip", tag = "v1.*" }
	use {
		"hrsh7th/nvim-cmp",
		config = [[ require "plugin-configs.cmp" ]],
		requires = {
			"nvim-treesitter/nvim-treesitter",
			"hrsh7th/cmp-nvim-lsp",
			"onsails/lspkind-nvim",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-emoji",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-nvim-lsp-document-symbol",
		},
	}
	use {
		"b0o/mapx.nvim",
		config = [[ require "keyboard-mappings" ]],
	}
	use {
		"folke/trouble.nvim",
		config = [[ require "plugin-configs.trouble" ]],
	}
	use { "f-person/git-blame.nvim" }
	use "lewis6991/gitsigns.nvim"
	use "jparise/vim-graphql"
	use {
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup {}
		end,
	}
	use {
		"ThePrimeagen/refactoring.nvim",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	}
	use "wbthomason/packer.nvim"
	use "williamboman/mason.nvim"
	use {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		config = [[ require "plugin-configs.mason" ]],
		after = "mason.nvim",
	}
	use {
		"jose-elias-alvarez/null-ls.nvim",
		config = [[ require "plugin-configs.null-ls" ]]
	}

	-- Window management
	use {
		"aserowy/tmux.nvim",
		config = [[ require "plugin-configs.tmux" ]],
	}
	use {
		"akinsho/bufferline.nvim",
		tag = "v2.*",
		requires = "kyazdani42/nvim-web-devicons",
		config = [[ require "plugin-configs.bufferline" ]],
	}

	-- File management.
	use {
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons",
		},
		config = [[ require "plugin-configs.nvim-tree" ]],
	}

	-- Code helpers.
	use "github/copilot.vim"
	use "sebdah/vim-delve"
	use {
		"windwp/nvim-autopairs",
		config = [[ require "plugin-configs.autopairs" ]],
	}
	use "tpope/vim-endwise"
	use "tpope/vim-fugitive"
	use "terryma/vim-multiple-cursors"
	use "liuchengxu/vista.vim"
	use "tpope/vim-surround"
	use "vim-test/vim-test"
	use "voldikss/vim-floaterm"
	use {
		"ray-x/go.nvim",
		requires = {
			"ray-x/guihua.lua",
			"nvim-treesitter/nvim-treesitter",
		},
	}
	use "b0o/schemastore.nvim"

	-- Visual.
	use {
		"nvim-lualine/lualine.nvim",
		requires = {
			"kyazdani42/nvim-web-devicons",
			opt = true,
		},
		config = [[ require "plugin-configs.lualine" ]],
	}
	use {
		"nvim-telescope/telescope.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-packer.nvim",
			"nvim-telescope/telescope-dap.nvim",
		},
		config = [[ require "plugin-configs.telescope" ]],
	}
	use {
		"marko-cerovac/material.nvim",
		config = [[ require "plugin-configs.theme" ]],
	}
	use {
		"goolord/alpha-nvim",
		config = function()
			require("plugin-configs.dashboard").setup()
		end,
	}
	use {
		"rcarriga/nvim-notify",
		config = function()
			vim.notify = require "notify"
		end,
	}

	-- Debugging
	use {
		"mfussenegger/nvim-dap",
		config = [[ require "plugin-configs.nvim-dap" ]],
		module = "dap",
		requires = {
			"theHamsta/nvim-dap-virtual-text",
			"jbyuki/one-small-step-for-vimkind",
		},
	}

	use {
		"leoluz/nvim-dap-go",
		after = "nvim-dap",
		config = [[ require "plugin-configs.nvim-dap-go" ]],
	}

	use {
		"rcarriga/nvim-dap-ui",
		after = "nvim-dap",
		config = [[ require "plugin-configs.nvim-dap-gui" ]],
	}

	if packer_bootstrap then
		require("packer").sync()
	end
end)
