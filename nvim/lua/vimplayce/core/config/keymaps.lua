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
-- splits
map("n", "<leader>wv", "<C-W>v", opts)
map("n", "<leader>ws", "<C-W>s", opts)
map("n", "<leader>wf", ":vnew ", { noremap = true })
-- select
map("n", "<leader>wh", "<C-W>h", opts)
map("n", "<leader>wj", "<C-W>j", opts)
map("n", "<leader>wk", "<C-W>k", opts)
map("n", "<leader>wl", "<C-W>l", opts)
-- move
map("n", "<leader>wH", "<C-W>H", opts)
map("n", "<leader>wJ", "<C-W>J", opts)
map("n", "<leader>wK", "<C-W>K", opts)
map("n", "<leader>wL", "<C-W>L", opts)
map("n", "<leader>wr", "<C-W>r", opts)
map("n", "<leader>wR", "<C-W>R", opts)
-- resize
map("n", "<leader>wF", ":resize <bar> :vertical resize<CR>", opts)
map("n", "<leader>wE", "<C-W>=", opts)
-- close
map("n", "<leader>wc", "<C-W>c", opts)
map("n", "<leader>wo", "<C-W>o", opts)
