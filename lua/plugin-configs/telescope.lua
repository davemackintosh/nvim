require("telescope").setup {
	pickers = {
		find_files = {
			theme = "dropdown",
		},
	},
}
require("telescope").load_extension "packer"
require("telescope").load_extension "dap"
-- require "telescope".extensions.packer.packer()
