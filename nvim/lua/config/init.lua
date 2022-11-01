-- Change colorscheme to everforest
vim.cmd[[colorscheme everforest]]

-- Import custom configs
for _, import in pairs({
    'autocmd',
    'highlight',
    'keymap',
}) do
    local ok, _ = pcall(require, 'config.' .. import)
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
