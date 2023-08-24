local opts = { noremap = true, silent = true }

local map = vim.keymap.set

-- NOH
map("n", "H", ":noh<CR>", opts)

-- Yank & Paste
map({ "n", "v" }, "gy", '"+y', opts)
map({ "n", "v" }, "gp", '"+p', opts)

-- Buffers mappings
map("n", "gh", ":bp<cr>", opts)
map("n", "gl", ":bn<cr>", opts)
map("n", "gb", ":buffers<cr>:buffer ")

-- Tags
map("n", "gd", ":tjump <cword><CR>")
map("n", "gD", ":ptjump <cword><CR>")
map("n", "gt", ":pop<CR>")

-- Marks - goto marks
map("n", "gm", "`", opts)
map("n", "gM", ":marks<CR>:normal gm", opts)
map("n", "dm", ":delmarks ", {})
map("n", "dM", ":delmarks a-zA-Z<CR><CR>", opts)

-- Window mappings
-- closing
map("n", "<A-c>", "<C-W>c", opts)
map("n", "<A-o>", "<C-W>o", opts)
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

-- shortcut to grep search some text and quickfix navigation
map("n", "g/", ":Agrep <cword><CR>", opts)
map("n", "g?", ":Agrep ")

-- Shortcut to create screenshot of the highlighted code
if vim.fn.executable("wkhtmltoimage") == 1 then
	map("v", "<C-s>", function()
		local timestamp = os.date("!%d%m%H%M%S")
		local basename = "/tmp/snippet-" .. timestamp
		vim.api.nvim_set_var("html_number_lines", "0")
		-- magic -- must be dirty but :shrug:
		vim.cmd(
			string.format(
				":'<,'>TOhtml | :w %s.html | :bd! | :silent !wkhtmltoimage %s.html %s.jpg",
				basename,
				basename,
				basename
			)
		)
	end, {})
end
