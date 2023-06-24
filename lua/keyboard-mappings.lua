local mapx = require("mapx").setup()

vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "gi", vim.lsp.buf.implementation)
vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
vim.keymap.set("n", "gr", vim.lsp.buf.references)
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

-- Run format on save
vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]

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
mapx.nnoremap("<C-A>", "<cmd>LspRestart<CR>")
mapx.nnoremap("<C-wq>", "<cmd>bd<CR>")
mapx.nnoremap("[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
mapx.nnoremap("]d", "<cmd>lua vim.diagnostic.goto_next()<CR>")
mapx.nnoremap("<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
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
