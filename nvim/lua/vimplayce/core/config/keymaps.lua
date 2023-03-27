local opts = { noremap = true, silent = true }

local map = vim.keymap.set
local leadermap = function(mode, mapping, cmd, opts) vim.keymap.set(mode, "<leader>" .. mapping, cmd, opts) end

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
leadermap("n", "bb", ":buffers<cr>:buffer ", { noremap = true })

-- Window mappings
-- closing
leadermap("n", "wc", "<C-W>c", opts)
leadermap("n", "wo", "<C-W>o", opts)
-- splits
leadermap("n", "wv", "<C-W>v", opts)
leadermap("n", "ws", "<C-W>s", opts)
leadermap("n", "wn", ":vnew ", { noremap = true })
-- select
leadermap("n", "wh", "<C-W>h", opts)
leadermap("n", "wj", "<C-W>j", opts)
leadermap("n", "wk", "<C-W>k", opts)
leadermap("n", "wl", "<C-W>l", opts)
-- resize
leadermap("n", "wf", ":resize <bar> :vertical resize<CR>", opts)
leadermap("n", "we", "<C-W>=", opts)
-- move
leadermap("n", "wmh", "<C-W>H", opts)
leadermap("n", "wmj", "<C-W>J", opts)
leadermap("n", "wmk", "<C-W>K", opts)
leadermap("n", "wml", "<C-W>L", opts)
