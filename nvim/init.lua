-- import vimplayce configuration and plugins
local ok = pcall(require, 'vimplayce')
if not ok then
    vim.notify([[Couldn't load vimplayce configuration and plugins.]], vim.log.levels.ERROR)
end
