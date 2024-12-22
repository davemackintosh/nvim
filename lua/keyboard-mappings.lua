local mapx = require("mapx").setup()
local crates = require('crates')

vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "gi", vim.lsp.buf.implementation)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
vim.keymap.set("n", "gr", vim.lsp.buf.references)

local opts = { noremap = true, silent = true }
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
mapx.nnoremap("<C-o>", ":NvimTreeToggle<Cr>")                                     -- Toggle file explorer.
mapx.nnoremap("<C-p>", ":Telescope find_files<Cr>")                               -- Search for files.
mapx.nnoremap("<C-s>", ":Lspsaga outline<Cr>")                                    -- Show symbols outline.
mapx.nnoremap("<C-f>", ":Telescope live_grep<Cr>")                                -- Search in files.
mapx.nnoremap("<C-D>", ":TroubleToggle<Cr>")                                      -- Show workspace issues.

mapx.inoremap("<F5>", "<cmd>:DapContinue<Cr>", "silent", { ft = "go" })           -- Debug go tests in insert mode.
mapx.nnoremap("<F5>", "<cmd>:DapContinue<Cr>", "silent", { ft = "go" })           -- Debug go tests in normal mode.

mapx.inoremap("<C-t>", "<cmd>:DlvTestCurrent<Cr>", "silent", { ft = "go" })       -- Run go tests in insert mode.
mapx.nnoremap("<C-t>", "<cmd>:DlvTestCurrent<Cr>", "silent", { ft = "go" })       -- Run go tests in normal mode.

mapx.inoremap("<F5>", "<cmd>:RustLsp debuggables<Cr>", "silent", { ft = "rust" }) -- Run Rust tests in insert mode.
mapx.nnoremap("<F5>", "<cmd>:RustLsp debuggables<Cr>", "silent", { ft = "rust" }) -- Run Rust tests in normal mode.
-- Define your keybindings
vim.keymap.set("n", "<leader>ct", crates.toggle, opts)
vim.keymap.set("n", "<leader>cr", crates.reload, opts)

vim.keymap.set("n", "<leader>cv", crates.show_versions_popup, opts)
vim.keymap.set("n", "<leader>cf", crates.show_features_popup, opts)
vim.keymap.set("n", "<leader>cd", crates.show_dependencies_popup, opts)

vim.keymap.set("n", "<leader>cu", crates.update_crate, opts)
vim.keymap.set("v", "<leader>cu", crates.update_crates, opts)
vim.keymap.set("n", "<leader>ca", crates.update_all_crates, opts)
vim.keymap.set("n", "<leader>cU", crates.upgrade_crate, opts)
vim.keymap.set("v", "<leader>cU", crates.upgrade_crates, opts)
vim.keymap.set("n", "<leader>cA", crates.upgrade_all_crates, opts)

vim.keymap.set("n", "<leader>cx", crates.expand_plain_crate_to_inline_table, opts)
vim.keymap.set("n", "<leader>cX", crates.extract_crate_into_table, opts)

vim.keymap.set("n", "<leader>cH", crates.open_homepage, opts)
vim.keymap.set("n", "<leader>cR", crates.open_repository, opts)
vim.keymap.set("n", "<leader>cD", crates.open_documentation, opts)
vim.keymap.set("n", "<leader>cC", crates.open_crates_io, opts)

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
mapx.nnoremap("do", "<cmd>Lspsaga code_action<CR>", "Code Action")
mapx.nnoremap(
	"se",
	"<cmd>lua vim.diagnostic.open_float()<CR>",
	"Line Diagnostics"
)
