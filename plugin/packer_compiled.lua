-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function("has", { "nvim-0.5" }) ~= 1 then
	vim.api.nvim_command 'echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"'
	return
end

vim.api.nvim_command "packadd packer.nvim"

local no_errors, error_msg = pcall(function()
	_G._packer = _G._packer or {}
	_G._packer.inside_compile = true

	local time
	local profile_info
	local should_profile = false
	if should_profile then
		local hrtime = vim.loop.hrtime
		profile_info = {}
		time = function(chunk, start)
			if start then
				profile_info[chunk] = hrtime()
			else
				profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
			end
		end
	else
		time = function(chunk, start) end
	end

	local function save_profiles(threshold)
		local sorted_times = {}
		for chunk_name, time_taken in pairs(profile_info) do
			sorted_times[#sorted_times + 1] = { chunk_name, time_taken }
		end
		table.sort(sorted_times, function(a, b)
			return a[2] > b[2]
		end)
		local results = {}
		for i, elem in ipairs(sorted_times) do
			if not threshold or threshold and elem[2] > threshold then
				results[i] = elem[1] .. " took " .. elem[2] .. "ms"
			end
		end
		if threshold then
			table.insert(
				results,
				"(Only showing plugins that took longer than "
					.. threshold
					.. " ms "
					.. "to load)"
			)
		end

		_G._packer.profile_output = results
	end

	time([[Luarocks path setup]], true)
	local package_path_str =
		"/Users/dave/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/dave/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/dave/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/dave/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
	local install_cpath_pattern =
		"/Users/dave/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
	if not string.find(package.path, package_path_str, 1, true) then
		package.path = package.path .. ";" .. package_path_str
	end

	if not string.find(package.cpath, install_cpath_pattern, 1, true) then
		package.cpath = package.cpath .. ";" .. install_cpath_pattern
	end

	time([[Luarocks path setup]], false)
	time([[try_loadstring definition]], true)
	local function try_loadstring(s, component, name)
		local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
		if not success then
			vim.schedule(function()
				vim.api.nvim_notify(
					"packer.nvim: Error running "
						.. component
						.. " for "
						.. name
						.. ": "
						.. result,
					vim.log.levels.ERROR,
					{}
				)
			end)
		end
		return result
	end

	time([[try_loadstring definition]], false)
	time([[Defining packer_plugins]], true)
	_G.packer_plugins = {
		LuaSnip = {
			loaded = true,
			path = "/Users/dave/.local/share/nvim/site/pack/packer/start/LuaSnip",
			url = "https://github.com/L3MON4D3/LuaSnip",
		},
		["alpha-nvim"] = {
			config = {
				"\27LJ\2\nF\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\29plugin-configs.dashboard\frequire\0",
			},
			loaded = true,
			path = "/Users/dave/.local/share/nvim/site/pack/packer/start/alpha-nvim",
			url = "https://github.com/goolord/alpha-nvim",
		},
		["bufferline.nvim"] = {
			config = { ' require "plugin-configs.bufferline" ' },
			loaded = true,
			path = "/Users/dave/.local/share/nvim/site/pack/packer/start/bufferline.nvim",
			url = "https://github.com/akinsho/bufferline.nvim",
		},
		["cmp-buffer"] = {
			loaded = true,
			path = "/Users/dave/.local/share/nvim/site/pack/packer/start/cmp-buffer",
			url = "https://github.com/hrsh7th/cmp-buffer",
		},
		["cmp-cmdline"] = {
			loaded = true,
			path = "/Users/dave/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
			url = "https://github.com/hrsh7th/cmp-cmdline",
		},
		["cmp-emoji"] = {
			loaded = true,
			path = "/Users/dave/.local/share/nvim/site/pack/packer/start/cmp-emoji",
			url = "https://github.com/hrsh7th/cmp-emoji",
		},
		["cmp-nvim-lsp"] = {
			loaded = true,
			path = "/Users/dave/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
			url = "https://github.com/hrsh7th/cmp-nvim-lsp",
		},
		["cmp-nvim-lsp-document-symbol"] = {
			loaded = true,
			path = "/Users/dave/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp-document-symbol",
			url = "https://github.com/hrsh7th/cmp-nvim-lsp-document-symbol",
		},
		["cmp-nvim-lua"] = {
			loaded = true,
			path = "/Users/dave/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua",
			url = "https://github.com/hrsh7th/cmp-nvim-lua",
		},
		["cmp-path"] = {
			loaded = true,
			path = "/Users/dave/.local/share/nvim/site/pack/packer/start/cmp-path",
			url = "https://github.com/hrsh7th/cmp-path",
		},
		cmp_luasnip = {
			loaded = true,
			path = "/Users/dave/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
			url = "https://github.com/saadparwaiz1/cmp_luasnip",
		},
		["copilot.vim"] = {
			loaded = true,
			path = "/Users/dave/.local/share/nvim/site/pack/packer/start/copilot.vim",
			url = "https://github.com/github/copilot.vim",
		},
		["editorconfig.nvim"] = {
			loaded = true,
			path = "/Users/dave/.local/share/nvim/site/pack/packer/start/editorconfig.nvim",
			url = "https://github.com/gpanders/editorconfig.nvim",
		},
		["git-blame.nvim"] = {
			loaded = true,
			path = "/Users/dave/.local/share/nvim/site/pack/packer/start/git-blame.nvim",
			url = "https://github.com/f-person/git-blame.nvim",
		},
		["gitsigns.nvim"] = {
			loaded = true,
			path = "/Users/dave/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
			url = "https://github.com/lewis6991/gitsigns.nvim",
		},
		["go.nvim"] = {
			loaded = true,
			path = "/Users/dave/.local/share/nvim/site/pack/packer/start/go.nvim",
			url = "https://github.com/ray-x/go.nvim",
		},
		["guihua.lua"] = {
			loaded = true,
			path = "/Users/dave/.local/share/nvim/site/pack/packer/start/guihua.lua",
			url = "https://github.com/ray-x/guihua.lua",
		},
		["lsp_signature.nvim"] = {
			loaded = true,
			path = "/Users/dave/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim",
			url = "https://github.com/ray-x/lsp_signature.nvim",
		},
		["lspkind-nvim"] = {
			loaded = true,
			path = "/Users/dave/.local/share/nvim/site/pack/packer/start/lspkind-nvim",
			url = "https://github.com/onsails/lspkind-nvim",
		},
		["lspkind.nvim"] = {
			loaded = true,
			path = "/Users/dave/.local/share/nvim/site/pack/packer/start/lspkind.nvim",
			url = "https://github.com/onsails/lspkind.nvim",
		},
		["lspsaga.nvim"] = {
			loaded = true,
			path = "/Users/dave/.local/share/nvim/site/pack/packer/start/lspsaga.nvim",
			url = "https://github.com/tami5/lspsaga.nvim",
		},
		["lualine.nvim"] = {
			config = { ' require "plugin-configs.lualine" ' },
			loaded = true,
			path = "/Users/dave/.local/share/nvim/site/pack/packer/start/lualine.nvim",
			url = "https://github.com/nvim-lualine/lualine.nvim",
		},
		["mapx.nvim"] = {
			config = { ' require "keyboard-mappings" ' },
			loaded = true,
			path = "/Users/dave/.local/share/nvim/site/pack/packer/start/mapx.nvim",
			url = "https://github.com/b0o/mapx.nvim",
		},
		["mason-lspconfig.nvim"] = {
			loaded = true,
			path = "/Users/dave/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
			url = "https://github.com/williamboman/mason-lspconfig.nvim",
		},
		["mason-tool-installer.nvim"] = {
			loaded = true,
			path = "/Users/dave/.local/share/nvim/site/pack/packer/start/mason-tool-installer.nvim",
			url = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		["mason.nvim"] = {
			loaded = true,
			path = "/Users/dave/.local/share/nvim/site/pack/packer/start/mason.nvim",
			url = "https://github.com/williamboman/mason.nvim",
		},
		["material.nvim"] = {
			config = { ' require "plugin-configs.theme" ' },
			loaded = true,
			path = "/Users/dave/.local/share/nvim/site/pack/packer/start/material.nvim",
			url = "https://github.com/marko-cerovac/material.nvim",
		},
		["nvim-autopairs"] = {
			config = { ' require "plugin-configs.autopairs" ' },
			loaded = true,
			path = "/Users/dave/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
			url = "https://github.com/windwp/nvim-autopairs",
		},
		["nvim-cmp"] = {
			config = { ' require "plugin-configs.cmp" ' },
			loaded = true,
			path = "/Users/dave/.local/share/nvim/site/pack/packer/start/nvim-cmp",
			url = "https://github.com/hrsh7th/nvim-cmp",
		},
		["nvim-dap"] = {
			after = { "nvim-dap-go", "nvim-dap-ui" },
			config = { ' require "plugin-configs.nvim-dap" ' },
			loaded = false,
			needs_bufread = false,
			only_cond = false,
			path = "/Users/dave/.local/share/nvim/site/pack/packer/opt/nvim-dap",
			url = "https://github.com/mfussenegger/nvim-dap",
		},
		["nvim-dap-go"] = {
			config = { ' require "plugin-configs.nvim-dap-go" ' },
			load_after = {
				["nvim-dap"] = true,
			},
			loaded = false,
			needs_bufread = false,
			path = "/Users/dave/.local/share/nvim/site/pack/packer/opt/nvim-dap-go",
			url = "https://github.com/leoluz/nvim-dap-go",
		},
		["nvim-dap-ui"] = {
			config = { ' require "plugin-configs.nvim-dap-gui" ' },
			load_after = {
				["nvim-dap"] = true,
			},
			loaded = false,
			needs_bufread = false,
			path = "/Users/dave/.local/share/nvim/site/pack/packer/opt/nvim-dap-ui",
			url = "https://github.com/rcarriga/nvim-dap-ui",
		},
		["nvim-dap-virtual-text"] = {
			loaded = true,
			path = "/Users/dave/.local/share/nvim/site/pack/packer/start/nvim-dap-virtual-text",
			url = "https://github.com/theHamsta/nvim-dap-virtual-text",
		},
		["nvim-lspconfig"] = {
			config = { ' require "plugin-configs.lsp" ' },
			loaded = true,
			path = "/Users/dave/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
			url = "https://github.com/neovim/nvim-lspconfig",
		},
		["nvim-lspupdate"] = {
			loaded = true,
			path = "/Users/dave/.local/share/nvim/site/pack/packer/start/nvim-lspupdate",
			url = "https://github.com/alexaandru/nvim-lspupdate",
		},
		["nvim-notify"] = {
			config = {
				"\27LJ\2\n2\0\0\4\0\3\0\0066\0\0\0006\1\2\0'\3\1\0B\1\2\2=\1\1\0K\0\1\0\frequire\vnotify\bvim\0",
			},
			loaded = true,
			path = "/Users/dave/.local/share/nvim/site/pack/packer/start/nvim-notify",
			url = "https://github.com/rcarriga/nvim-notify",
		},
		["nvim-tree.lua"] = {
			config = { ' require "plugin-configs.nvim-tree" ' },
			loaded = true,
			path = "/Users/dave/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
			url = "https://github.com/kyazdani42/nvim-tree.lua",
		},
		["nvim-treesitter"] = {
			loaded = true,
			path = "/Users/dave/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
			url = "https://github.com/nvim-treesitter/nvim-treesitter",
		},
		["nvim-web-devicons"] = {
			loaded = true,
			path = "/Users/dave/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
			url = "https://github.com/kyazdani42/nvim-web-devicons",
		},
		["one-small-step-for-vimkind"] = {
			loaded = true,
			path = "/Users/dave/.local/share/nvim/site/pack/packer/start/one-small-step-for-vimkind",
			url = "https://github.com/jbyuki/one-small-step-for-vimkind",
		},
		["packer.nvim"] = {
			loaded = true,
			path = "/Users/dave/.local/share/nvim/site/pack/packer/start/packer.nvim",
			url = "https://github.com/wbthomason/packer.nvim",
		},
		["plenary.nvim"] = {
			loaded = true,
			path = "/Users/dave/.local/share/nvim/site/pack/packer/start/plenary.nvim",
			url = "https://github.com/nvim-lua/plenary.nvim",
		},
		["refactoring.nvim"] = {
			loaded = true,
			path = "/Users/dave/.local/share/nvim/site/pack/packer/start/refactoring.nvim",
			url = "https://github.com/ThePrimeagen/refactoring.nvim",
		},
		["schemastore.nvim"] = {
			loaded = true,
			path = "/Users/dave/.local/share/nvim/site/pack/packer/start/schemastore.nvim",
			url = "https://github.com/b0o/schemastore.nvim",
		},
		["telescope-dap.nvim"] = {
			loaded = true,
			path = "/Users/dave/.local/share/nvim/site/pack/packer/start/telescope-dap.nvim",
			url = "https://github.com/nvim-telescope/telescope-dap.nvim",
		},
		["telescope-packer.nvim"] = {
			loaded = true,
			path = "/Users/dave/.local/share/nvim/site/pack/packer/start/telescope-packer.nvim",
			url = "https://github.com/nvim-telescope/telescope-packer.nvim",
		},
		["telescope.nvim"] = {
			config = { ' require "plugin-configs.telescope" ' },
			loaded = true,
			path = "/Users/dave/.local/share/nvim/site/pack/packer/start/telescope.nvim",
			url = "https://github.com/nvim-telescope/telescope.nvim",
		},
		["tmux.nvim"] = {
			config = { ' require "plugin-configs.tmux" ' },
			loaded = true,
			path = "/Users/dave/.local/share/nvim/site/pack/packer/start/tmux.nvim",
			url = "https://github.com/aserowy/tmux.nvim",
		},
		["trouble.nvim"] = {
			config = { ' require "plugin-configs.trouble" ' },
			loaded = true,
			path = "/Users/dave/.local/share/nvim/site/pack/packer/start/trouble.nvim",
			url = "https://github.com/folke/trouble.nvim",
		},
		["vim-delve"] = {
			loaded = true,
			path = "/Users/dave/.local/share/nvim/site/pack/packer/start/vim-delve",
			url = "https://github.com/sebdah/vim-delve",
		},
		["vim-endwise"] = {
			loaded = true,
			path = "/Users/dave/.local/share/nvim/site/pack/packer/start/vim-endwise",
			url = "https://github.com/tpope/vim-endwise",
		},
		["vim-floaterm"] = {
			loaded = true,
			path = "/Users/dave/.local/share/nvim/site/pack/packer/start/vim-floaterm",
			url = "https://github.com/voldikss/vim-floaterm",
		},
		["vim-fugitive"] = {
			loaded = true,
			path = "/Users/dave/.local/share/nvim/site/pack/packer/start/vim-fugitive",
			url = "https://github.com/tpope/vim-fugitive",
		},
		["vim-graphql"] = {
			loaded = true,
			path = "/Users/dave/.local/share/nvim/site/pack/packer/start/vim-graphql",
			url = "https://github.com/jparise/vim-graphql",
		},
		["vim-multiple-cursors"] = {
			loaded = true,
			path = "/Users/dave/.local/share/nvim/site/pack/packer/start/vim-multiple-cursors",
			url = "https://github.com/terryma/vim-multiple-cursors",
		},
		["vim-surround"] = {
			loaded = true,
			path = "/Users/dave/.local/share/nvim/site/pack/packer/start/vim-surround",
			url = "https://github.com/tpope/vim-surround",
		},
		["vim-test"] = {
			loaded = true,
			path = "/Users/dave/.local/share/nvim/site/pack/packer/start/vim-test",
			url = "https://github.com/vim-test/vim-test",
		},
		["vista.vim"] = {
			loaded = true,
			path = "/Users/dave/.local/share/nvim/site/pack/packer/start/vista.vim",
			url = "https://github.com/liuchengxu/vista.vim",
		},
		["which-key.nvim"] = {
			config = {
				"\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\0",
			},
			loaded = true,
			path = "/Users/dave/.local/share/nvim/site/pack/packer/start/which-key.nvim",
			url = "https://github.com/folke/which-key.nvim",
		},
	}

	time([[Defining packer_plugins]], false)
	local module_lazy_loads = {
		["^dap"] = "nvim-dap",
	}
	local lazy_load_called = { ["packer.load"] = true }
	local function lazy_load_module(module_name)
		local to_load = {}
		if lazy_load_called[module_name] then
			return nil
		end
		lazy_load_called[module_name] = true
		for module_pat, plugin_name in pairs(module_lazy_loads) do
			if
				not _G.packer_plugins[plugin_name].loaded
				and string.match(module_name, module_pat)
			then
				to_load[#to_load + 1] = plugin_name
			end
		end

		if #to_load > 0 then
			require "packer.load"(
				to_load,
				{ module = module_name },
				_G.packer_plugins
			)
			local loaded_mod = package.loaded[module_name]
			if loaded_mod then
				return function(modname)
					return loaded_mod
				end
			end
		end
	end

	if not vim.g.packer_custom_loader_enabled then
		table.insert(package.loaders, 1, lazy_load_module)
		vim.g.packer_custom_loader_enabled = true
	end

	-- Config for: tmux.nvim
	time([[Config for tmux.nvim]], true)
	require "plugin-configs.tmux"
	time([[Config for tmux.nvim]], false)
	-- Config for: which-key.nvim
	time([[Config for which-key.nvim]], true)
	try_loadstring(
		"\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\0",
		"config",
		"which-key.nvim"
	)
	time([[Config for which-key.nvim]], false)
	-- Config for: material.nvim
	time([[Config for material.nvim]], true)
	require "plugin-configs.theme"
	time([[Config for material.nvim]], false)
	-- Config for: nvim-tree.lua
	time([[Config for nvim-tree.lua]], true)
	require "plugin-configs.nvim-tree"
	time([[Config for nvim-tree.lua]], false)
	-- Config for: lualine.nvim
	time([[Config for lualine.nvim]], true)
	require "plugin-configs.lualine"
	time([[Config for lualine.nvim]], false)
	-- Config for: nvim-autopairs
	time([[Config for nvim-autopairs]], true)
	require "plugin-configs.autopairs"
	time([[Config for nvim-autopairs]], false)
	-- Config for: alpha-nvim
	time([[Config for alpha-nvim]], true)
	try_loadstring(
		"\27LJ\2\nF\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\29plugin-configs.dashboard\frequire\0",
		"config",
		"alpha-nvim"
	)
	time([[Config for alpha-nvim]], false)
	-- Config for: mapx.nvim
	time([[Config for mapx.nvim]], true)
	require "keyboard-mappings"
	time([[Config for mapx.nvim]], false)
	-- Config for: nvim-cmp
	time([[Config for nvim-cmp]], true)
	require "plugin-configs.cmp"
	time([[Config for nvim-cmp]], false)
	-- Config for: nvim-lspconfig
	time([[Config for nvim-lspconfig]], true)
	require "plugin-configs.lsp"
	time([[Config for nvim-lspconfig]], false)
	-- Config for: bufferline.nvim
	time([[Config for bufferline.nvim]], true)
	require "plugin-configs.bufferline"
	time([[Config for bufferline.nvim]], false)
	-- Config for: nvim-notify
	time([[Config for nvim-notify]], true)
	try_loadstring(
		"\27LJ\2\n2\0\0\4\0\3\0\0066\0\0\0006\1\2\0'\3\1\0B\1\2\2=\1\1\0K\0\1\0\frequire\vnotify\bvim\0",
		"config",
		"nvim-notify"
	)
	time([[Config for nvim-notify]], false)
	-- Config for: telescope.nvim
	time([[Config for telescope.nvim]], true)
	require "plugin-configs.telescope"
	time([[Config for telescope.nvim]], false)
	-- Config for: trouble.nvim
	time([[Config for trouble.nvim]], true)
	require "plugin-configs.trouble"
	time([[Config for trouble.nvim]], false)

	_G._packer.inside_compile = false
	if _G._packer.needs_bufread == true then
		vim.cmd "doautocmd BufRead"
	end
	_G._packer.needs_bufread = false

	if should_profile then
		save_profiles()
	end
end)

if not no_errors then
	error_msg = error_msg:gsub('"', '\\"')
	vim.api.nvim_command(
		'echohl ErrorMsg | echom "Error in packer_compiled: '
			.. error_msg
			.. '" | echom "Please check your config for correctness" | echohl None'
	)
end
