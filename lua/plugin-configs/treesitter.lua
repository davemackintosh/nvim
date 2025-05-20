require("nvim-treesitter.configs").setup {
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = true,
	},
	auto_install = true,
	indent = { enable = true },
	ensure_installed = {}
}

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.elp = {
	install_info = {
		url = "/home/dave/www/cpp/treesitter/",
		files = { "src/parser.c" },
		branch = "main",
		generate_requires_npm = true,
		requires_generate_from_grammar = true,
	},
	filetype = "elp",
}
vim.treesitter.language.register('elp', 'elp')
vim.treesitter.language.register('elp', 'velp')
vim.treesitter.language.register('elp', 'selp')

vim.filetype.add({
	pattern = {
		['.*.elp'] = 'elp',
		['.*.velp'] = 'elp',
		['.*.selp'] = 'elp',
	},
})
