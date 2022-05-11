-- Collection of configurations for the built-in LSP client
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
	use "wbthomason/packer.nvim"

	-- Language support.
	use {
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	}
	use {
		"neovim/nvim-lspconfig",
		config = [[require "plugin-configs/lsp"]],
		requires = {
			"williamboman/nvim-lsp-installer",
			"ray-x/lsp_signature.nvim",
			"onsails/lspkind.nvim",
		},
	}
	use {
		"glepnir/lspsaga.nvim",
		config = function()
			require("lspsaga").init_lsp_saga {
				error_sign = "",
				warn_sign = "",
				hint_sign = "",
				infor_sign = "",
				border_style = "round",
			}
		end,
		after = "nvim-lspconfig",
		requires = {
			"nvim-lspconfig",
		},
	}
	use {
		"hrsh7th/nvim-cmp",
		config = [[require "plugin-configs/cmp"]],
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

	-- Window management
	use {
		"aserowy/tmux.nvim",
		config = [[require "plugin-configs/tmux"]],
	}

	-- File management.
	use {
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons",
		},
		config = [[require "plugin-configs/nvim-tree"]],
	}

	-- Code helpers.
	use "github/copilot.vim"
	use {
		"b0o/mapx.nvim",
		config = function()
			require("keyboard-mappings").setup()
		end,
	}
	use {
		"windwp/nvim-autopairs",
		config = [[require "plugin-configs/autopairs"]],
	}
	use "tpope/vim-endwise"
	use "tpope/vim-fugitive"
	use "terryma/vim-multiple-cursors"
	use "liuchengxu/vista.vim"
	use "tpope/vim-surround"
	use {
		"ray-x/go.nvim",
		config = [[require "plugin-configs/go"]],
		requires = {
			"nvim-treesitter/nvim-treesitter",
		},
	}

	-- Visual.
	use {
		"nvim-lualine/lualine.nvim",
		requires = {
			"kyazdani42/nvim-web-devicons",
			opt = true,
		},
		config = [[require "plugin-configs/lualine"]],
	}
	use {
		"nvim-telescope/telescope.nvim",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope-packer.nvim" },
			{ "nvim-telescope/telescope-dap.nvim" },
		},
		config = [[require "plugin-configs/telescope"]],
	}
	use {
		"marko-cerovac/material.nvim",
		config = [[require "plugin-configs/theme"]],
	}
	use "mhinz/vim-startify"
	use {
		"rcarriga/nvim-notify",
		config = function()
			vim.notify = require "notify"
		end,
	}

	-- Debugging
	use {
		"mfussenegger/nvim-dap",
		config = [[require "plugin-configs/nvim-dap"]],
		module = "dap",
		requires = {
			"theHamsta/nvim-dap-virtual-text",
			"jbyuki/one-small-step-for-vimkind",
		},
	}

	use "leoluz/nvim-dap-go"
	use { "rcarriga/nvim-dap-ui", after = "nvim-dap" }

	if packer_bootstrap then
		require("packer").sync()
	end
end)
