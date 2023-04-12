local M = {}

function M.setup()
	local status_ok, alpha = pcall(require, "alpha")
	if not status_ok then
		return
	end

	local stats = require("lazy").stats()

	local dashboard = require "alpha.themes.dashboard"
	dashboard.section.header.val = {
		[[               _____                                     ]],
		[[              /     \                                    ]],
		[[              vvvvvvv  /|__/|                            ]],
		[[                 I   /O,O   |                            ]],
		[[                 I /_____   |      /|/|                  ]],
		[[                J|/^ ^ ^ \  |    /00  |    _//|          ]],
		[[                 |^ ^ ^ ^ |W|   |/^^\ |   /oo |          ]],
		[[                  \m___m__|_|    \m_m_|   \mm_|          ]],
	}

	dashboard.section.buttons.val = {
		dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
		dashboard.button(
			"r",
			"  Recently used files",
			":Telescope oldfiles <CR>"
		),
		dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
	}

	local function footer()
		-- Number of plugins
		local datetime = os.date "%d-%m-%Y %H:%M:%S"
		local plugins_text = "   "
			.. stats.count
			.. " plugins"
			.. "   v"
			.. vim.version().major
			.. "."
			.. vim.version().minor
			.. "."
			.. vim.version().patch
			.. "   "
			.. datetime

		-- Quote
		local fortune = require "alpha.fortune"
		local quote = table.concat(fortune(), "\n")

		return plugins_text .. "\n" .. quote
	end

	dashboard.section.footer.val = footer()

	dashboard.section.footer.opts.hl = "Type"
	dashboard.section.header.opts.hl = "Include"
	dashboard.section.buttons.opts.hl = "Keyword"

	dashboard.opts.opts.noautocmd = true
	alpha.setup(dashboard.opts)
end

return M
