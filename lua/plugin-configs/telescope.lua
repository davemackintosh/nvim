local ts = require "telescope"
ts.load_extension "packer"
ts.load_extension "dap"

ts.setup {
	pickers = {
		find_files = {
			theme = "dropdown",
		},
	},
	extensions = {
		packer = {
			theme = "ivy",
			layout_config = {
				height = 0.5,
			},
		},
	},
	dap = {},
}
