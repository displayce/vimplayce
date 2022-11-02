-- Change colorscheme to everforest
local ok = pcall(vim.cmd, [[colorscheme everforest]])
if not ok then
    vim.notify[[Couldn't load colorscheme, using default one.]]
end

-- Import custom configs
for _, import in pairs({
    'autocmd',
    'highlight',
    'keymap',
}) do
    local ok, _ = pcall(require, 'vimplayce.config.' .. import)
    if not ok then
	vim.notify('Could\'t import ' .. import .. ' configuration file.', vim.log.levels.WARN)
    end
end

-- global configuration
vim.o.signcolumn='yes:1'
vim.o.shiftwidth=4
vim.o.tabline=4

vim.o.number = true
vim.o.relativenumber = true

vim.o.termguicolors = true
-- vim.o.cmdheight = 0
vim.o.laststatus = 3
