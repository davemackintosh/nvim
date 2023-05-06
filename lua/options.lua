local AUGroups = require "augroups"
local o = vim.opt
local fn = vim.fn
local map = vim.api.nvim_set_keymap

-- map the leader key
map("n", ",", "", {})
vim.g.mapleader = ","
vim.cmd "set inccommand=split"
o.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50" -- block in normal and beam cursor in insert mode
o.updatetime = 300 -- faster completion
o.timeoutlen = 400 -- time to wait for a mapped sequence to complete (in milliseconds)
o.ttimeoutlen = 0 -- Time in milliseconds to wait for a key code sequence to complete
o.backup = false -- creates a backup file
o.swapfile = false -- enable/disable swap file creation
o.mouse = "a"
o.mousefocus = true
o.dir = fn.stdpath "data" .. "/swp" -- swap file directory
o.undofile = true -- enable/disable undo file creation
o.undodir = fn.stdpath "data" .. "/undodir" -- set undo directory
o.history = 500 -- Use the 'history' option to set the number of lines from command mode that are remembered.
o.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
-- o.fileencoding = "utf-8"                    -- the encoding written to a file
o.conceallevel = 0 -- so that `` is visible in markdown files
o.cursorline = false -- hide the cursor line
o.number = true
o.relativenumber = true
o.cmdheight = 1 -- space for displaying messages/commands
o.showmode = false -- we don't need to see things like -- INSERT -- anymore
o.showtabline = 1 -- always show tabs
o.laststatus = 3
o.smartcase = true -- smart case
o.smartindent = true -- make indenting smarter again
o.splitbelow = true -- force all horizontal splits to go below current window
o.splitright = true -- force all vertical splits to go to the right of current window
o.expandtab = false -- convert tabs to spaces
o.shiftwidth = 4 -- the number of spaces inserted for each indentation
o.tabstop = 4 -- how many columns a tab counts for
o.termguicolors = true -- set term gui colors (most terminals support this)
o.scrolloff = 3 -- Minimal number of screen lines to keep above and below the cursor
o.sidescrolloff = 5 -- The minimal number of columns to scroll horizontally
o.hlsearch = true -- highlight all matches on previous search pattern
o.ignorecase = true -- ignore case in search patterns
o.foldenable = true -- disable folding; enable with zi
o.foldmethod = "expr"
o.foldexpr = "nvim_treesitter#foldexpr()"
o.fillchars = {
	eob = " ", -- End-of-buffer: ~
}
vim.g.rainbow_active = 1
o.listchars = {
	tab = "┆ ",
	trail = "~",
}
o.list = true
o.shortmess = o.shortmess + "c" -- prevent "pattern not found" messages
o.wildmode = "full"
o.lazyredraw = false
o.completeopt = { "menu", "menuone", "noselect", "noinsert" } -- A comma separated list of options for Insert mode completion
o.wildignorecase = true -- When set case is ignored when completing file names and directories
o.wildignore = [[
.git,.hg,.svn
*.aux,*.out,*.toc
*.o,*.obj,*.exe,*.dll,*.manifest,*.rbc,*.class
*.ai,*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png,*.psd,*.webp
*.avi,*.divx,*.mp4,*.webm,*.mov,*.m2ts,*.mkv,*.vob,*.mpg,*.mpeg
*.mp3,*.oga,*.ogg,*.wav,*.flac
*.eot,*.otf,*.ttf,*.woff
*.doc,*.pdf,*.cbr,*.cbz
*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz,*.kgb
*.swp,.lock,.DS_Store,._*
*/tmp/*,*.so,*.swp,*.zip,**/node_modules/**,**/target/**,**.terraform/**"
]]

-- Register the AUGroups and autocommands
local autoCommands = {
	open_folds = {
		{ "BufEnter", "*", "normal zx zR" },
	},
	-- format on write.
	format_on_write = {
		{ "BufWritePre", "*", "lua vim.lsp.buf.format()" },
	},
	-- EslintFixAll on save typescript and javascript files.
	eslint_fix_all = {
		{ "BufWritePre", "*.ts,*.js,*.tsx", "EslintFixAll" },

		-- Do go auto imports on save.
		{
			"BufWritePre",
			"*.go",
			'lua vim.lsp.buf.code_action({ context = { only = { "source.organizeImports" } }, apply = true })',
		},
	},
	compile_commands_generate = {
		{
			"BufWritePost",
			"*.cpp,*.hpp,*.c,*.h,*.cc,*.hh,*.cxx,*.hxx,*.m,*.mm",
			"silent! exec 'make compile_commands.json'",
		},
	},
}

AUGroups.CreateFrom(autoCommands)
