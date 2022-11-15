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
