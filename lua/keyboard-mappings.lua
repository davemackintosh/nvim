local mapx = require("mapx").setup()

-- Better window swapping
mapx.nnoremap("<C-h>", "<C-w>h")
mapx.nnoremap("<C-j>", "<C-w>j")
mapx.nnoremap("<C-k>", "<C-w>k")
mapx.nnoremap("<C-l>", "<C-w>l")

-- Utils
mapx.nnoremap("<C-o>", ":NvimTreeToggle<Cr>")
mapx.nnoremap("<C-p>", ":Telescope find_files<Cr>")
mapx.nnoremap("<C-s>", ":Vista!!<Cr>")
mapx.nnoremap("<C-f>", ":Telescope live_grep<Cr>")

mapx.inoremap("<C-t>", "<cmd>:DlvTestCurrent<Cr>")
mapx.nnoremap("<C-t>", "<cmd>:DlvTestCurrent<Cr>")
mapx.nnoremap("K", "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>")
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
mapx.nnoremap("gr", "<cmd>lua require('lspsaga.rename').rename()<CR>", "Rename")
mapx.nnoremap("do", "<cmd>lua require('lspsaga.codeaction').code_action()<CR>", "Code Action")
mapx.nnoremap("se", "<cmd>lua vim.diagnostic.open_float()<CR>", "Line Diagnostics")
