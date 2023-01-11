local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Disable space for leader usage
map("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- NOH
map("n", "<leader>h", ":noh<CR>", opts)

-- Yank & Paste
map({ "n", "v" }, "<leader>y", '"+y', opts)
map({ "n", "v" }, "<leader>p", '"+p', opts)

-- Buffers mappings
map("n", "<leader>bh", ":bp<cr>", opts)
map("n", "<leader>bl", ":bn<cr>", opts)
map("n", "<leader>bb", ":buffers<cr>:buffer ", { noremap = true })

-- Window mappings
-- closing
map("n", "<leader>wc", "<C-W>c", opts)
map("n", "<leader>wo", "<C-W>o", opts)
-- splits
map("n", "<leader>wv", "<C-W>v", opts)
map("n", "<leader>ws", "<C-W>s", opts)
map("n", "<leader>wn", ":vnew ", { noremap = true })
-- select
map("n", "<leader>wh", "<C-W>h", opts)
map("n", "<leader>wj", "<C-W>j", opts)
map("n", "<leader>wk", "<C-W>k", opts)
map("n", "<leader>wl", "<C-W>l", opts)
-- resize
map("n", "<leader>wf", ":resize <bar> :vertical resize<CR>", opts)
map("n", "<leader>we", "<C-W>=", opts)
-- move
map("n", "<leader>wmh", "<C-W>H", opts)
map("n", "<leader>wmj", "<C-W>J", opts)
map("n", "<leader>wmk", "<C-W>K", opts)
map("n", "<leader>wml", "<C-W>L", opts)
