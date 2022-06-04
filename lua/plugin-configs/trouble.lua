require("trouble").setup {}

local mapx = require "mapx".setup {}

mapx.nnoremap("<leader>xx", "<cmd>Trouble<cr>")
mapx.nnoremap(
	"<leader>xw",
	"<cmd>Trouble workspace_diagnostics<cr>"
)
mapx.nnoremap(
	"<leader>xd",
	"<cmd>Trouble document_diagnostics<cr>"
)
mapx.nnoremap(
	"<leader>xl",
	"<cmd>Trouble loclist<cr>"
)
mapx.nnoremap(
	"<leader>xq",
	"<cmd>Trouble quickfix<cr>"
)
mapx.nnoremap(
	"gR",
	"<cmd>Trouble lsp_references<cr>"
)
