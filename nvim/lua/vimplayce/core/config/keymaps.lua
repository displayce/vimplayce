local opts = { noremap = true, silent = true }

local map = vim.keymap.set
local leadermap = function(mode, mapping, cmd, options) map(mode, "<leader>" .. mapping, cmd, options) end

-- Disable space for leader usage
map("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- NOH
leadermap("n", "h", ":noh<CR>", opts)

-- Yank & Paste
leadermap({ "n", "v" }, "y", '"+y', opts)
leadermap({ "n", "v" }, "p", '"+p', opts)

-- Buffers mappings
leadermap("n", "bh", ":bp<cr>", opts)
leadermap("n", "bl", ":bn<cr>", opts)

-- Window mappings
-- closing
map("n", "<A-c>", "<C-W>c", opts)
map("n", "<A-u>", "<C-W>o", opts)
-- splits
map({ "n", "v" }, "<A-n>", ":vsplit<CR>", opts)
map({ "n", "v" }, "<A-S-n>", ":split<CR>", opts)
-- select
map("n", "<A-h>", "<C-W>h", opts)
map("n", "<A-j>", "<C-W>j", opts)
map("n", "<A-k>", "<C-W>k", opts)
map("n", "<A-l>", "<C-W>l", opts)
-- resize
map("n", "<A-f>", ":resize <bar> :vertical resize<CR>", opts)
map("n", "<A-e>", "<C-W>=", opts)
-- move
map("n", "<A-S-H>", "<C-W>H", opts)
map("n", "<A-S-J>", "<C-W>J", opts)
map("n", "<A-S-K>", "<C-W>K", opts)
map("n", "<A-S-L>", "<C-W>L", opts)

-- Plugin mappings
-- fzf-lua
leadermap("n", "fb", ":FzfLua buffers<CR>", opts)
leadermap("n", "ff", ":FzfLua files<CR>", opts)
leadermap("n", "fl", ":FzfLua lines<CR>", opts)
leadermap("n", "fg", ":FzfLua live_grep<CR>", opts)
leadermap("n", "fz", ":FzfLua builtins<CR>", opts)
