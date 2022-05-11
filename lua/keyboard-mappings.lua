local M = {}

function M.setup()
    local mapx = require "mapx".setup()

    -- Better window swapping
    mapx.nnoremap("<C-h>", "<C-w>h")
    mapx.nnoremap("<C-j>", "<C-w>j")
    mapx.nnoremap("<C-k>", "<C-w>k")
    mapx.nnoremap("<C-l>", "<C-w>l")

    -- Utils
    mapx.nnoremap("<C-u>", ":source $MYVIMRC<Cr>:PackerSync<Cr>")
    mapx.nnoremap("<C-o>", ":NvimTreeToggle<Cr>")
    mapx.nnoremap("<C-p>", ":Telescope find_files<Cr>")
    mapx.nnoremap("<C-s>", ":Vista!!<Cr>")

    mapx.nnoremap("<C-/>", ":Commentary<Cr>")
    mapx.nnoremap("<F5>", ":DlvTest<Cr>")
    mapx.nnoremap("<C-F5>", ":DlvTestCurrent<Cr>")
    mapx.nnoremap("<F6>", ":DlvDebug<Cr>")

		mapx.nnoremap("K", "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>")
		mapx.nnoremap("[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
		mapx.nnoremap("]d", "<cmd>lua vim.diagnostic.goto_next()<CR>")
		mapx.nnoremap("[c", "<cmd>lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.ERROR})<CR>")
		mapx.nnoremap("]c", "<cmd>lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.ERROR})<CR>")

		mapx.nnoremap("gr", "<cmd>lua require('lspsaga.rename').rename()<CR>", "Rename")
		mapx.nnoremap("do", "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code Action")
		mapx.nnoremap("de", "<cmd>lua vim.diagnostic.open_float()<CR>", "Line Diagnostics")
end

return M

