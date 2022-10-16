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
	-- The next few plugins are really the IDE feel.
	use "wbthomason/packer.nvim"
	use {
		"williamboman/mason.nvim",
		after = "packer.nvim",
	}
	use {
		"williamboman/mason-lspconfig.nvim",
		config = [[ require "plugin-configs.mason" ]],
		after = "mason.nvim",
	}
	use {
		"neovim/nvim-lspconfig",
		config = [[ require "plugin-configs.lsp" ]],
		requires = {
			"ray-x/lsp_signature.nvim",
			"onsails/lspkind.nvim",
		},
		after = "mason-lspconfig.nvim",
	}
	use {
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup {
				highlight = {
					enable = true,
				},
			}
		end,
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
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-nvim-lsp-document-symbol",
		},
	}
	use {
		"b0o/mapx.nvim",
		config = [[ require "keyboard-mappings" ]],
	}
	use "simrat39/rust-tools.nvim"
	use {
		"folke/trouble.nvim",
		config = [[ require "plugin-configs.trouble" ]],
	}
	use { "f-person/git-blame.nvim" }
	use "lewis6991/gitsigns.nvim"
	use {
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup {}
		end,
	}
	use {
		"weilbith/nvim-code-action-menu",
		cmd = "CodeActionMenu",
	}
	use {
		"ThePrimeagen/refactoring.nvim",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
		config = [[ require "plugin-configs.refactoring" ]],
	}
	use {
		"kosayoda/nvim-lightbulb",
		requires = "antoinemadec/FixCursorHold.nvim",
		config = [[ require("nvim-lightbulb").setup({autocmd = {enabled = true}}) ]],
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
	use {
		"github/copilot.vim",
		config = function()
			vim.g.copilot_filetypes = {
				["*"] = false,
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
				["java"] = true,
				["scala"] = true,
				["kotlin"] = true,
				["dart"] = true,
				["elixir"] = true,
				["erlang"] = true,
				["haskell"] = true,
				["ocaml"] = true,
				["php"] = true,
				["ruby"] = true,
				["swift"] = true,
				["vim"] = true,
			}
		end,
	}
	use "sebdah/vim-delve"
	use {
		"windwp/nvim-autopairs",
		config = [[ require "plugin-configs.autopairs" ]],
	}
	use "tpope/vim-endwise"
	use "tpope/vim-fugitive"
	use "terryma/vim-multiple-cursors"
	use {
		"simrat39/symbols-outline.nvim",
		config = [[ require("symbols-outline").setup() ]],
	}
	use "tpope/vim-surround"
	use "vim-test/vim-test"
	use "voldikss/vim-floaterm"
	--[[use {
		"ray-x/go.nvim",
		requires = {
			"ray-x/guihua.lua",
			"nvim-treesitter/nvim-treesitter",
		},
	}]] --
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
			local notify = require("notify")

			notify.setup({
				background_colour = "#000000",
			})

			vim.notify = notify
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
