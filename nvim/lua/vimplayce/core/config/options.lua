vim.o.signcolumn = "yes:1"
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.expandtab = true

vim.o.number = true
vim.o.relativenumber = true

vim.o.termguicolors = true
vim.o.laststatus = 3
vim.o.cmdheight = 0
vim.o.scrolloff = 5
vim.o.cursorline = true
vim.o.mouse = ""

vim.o.listchars = "tab:··"
vim.o.list = true
vim.o.foldmethod = "indent"
vim.o.foldenable = false

vim.o.textwidth = 80
vim.opt.formatoptions:remove("t")
for _, fopts in pairs({ "c", "r", "l" }) do
	vim.opt.formatoptions:append(fopts)
end
vim.o.spellsuggest="10,best"

vim.o.undofile = true

vim.o.splitbelow = true
vim.o.splitright = true

vim.opt.path:append("**")

if vim.fn.executable("ag") then
	vim.opt.grepprg = "ag --vimgrep"
end
