local mapx = require("mapx").setup()

-- Better window swapping
mapx.nnoremap("<C-h>", "<C-w>h")
mapx.nnoremap("<C-j>", "<C-w>j")
mapx.nnoremap("<C-k>", "<C-w>k")
mapx.nnoremap("<C-l>", "<C-w>l")

-- Utils
mapx.nnoremap("<C-o>", ":NvimTreeToggle<Cr>")                               -- Toggle file explorer.
mapx.nnoremap("<C-p>", ":Telescope find_files<Cr>")                         -- Search for files.
mapx.nnoremap("<C-s>", ":SymbolsOutline<Cr>")                               -- Show symbols outline.
mapx.nnoremap("<C-f>", ":Telescope live_grep<Cr>")                          -- Search in files.
mapx.nnoremap("<C-D>", ":TroubleToggle<Cr>")                                -- Show workspace issues.
mapx.inoremap("<C-t>", "<cmd>:DlvTestCurrent<Cr>", "silent", { ft = "go" }) -- Run go tests in insert mode.
mapx.nnoremap("<C-t>", "<cmd>:DlvTestCurrent<Cr>", "silent", { ft = "go" }) -- Run go tests in normal mode.
mapx.inoremap(
	"<C-t>",
	"<cmd>:!yarn test %<Cr>",
	"silent",
	{ ft = "typescript" }
)
mapx.nnoremap(
	"<C-t>",
	"<cmd>:!yarn test %<Cr>",
	"silent",
	{ ft = "typescript" }
)
mapx.nnoremap("<C-wq>", "<cmd>:bd<CR>")
mapx.nnoremap("[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
mapx.nnoremap("]d", "<cmd>lua vim.diagnostic.goto_next()<CR>")
mapx.nnoremap(
	"[c",
	"<cmd>lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.ERROR})<CR>"
)
mapx.nnoremap(
	"]c",
	"<cmd>lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.ERROR})<CR>"
)

mapx.nnoremap("gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
mapx.inoremap("<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
mapx.nnoremap("do", "<cmd>CodeActionMenu<CR>", "Code Action")
mapx.nnoremap(
	"se",
	"<cmd>lua vim.diagnostic.open_float()<CR>",
	"Line Diagnostics"
)
