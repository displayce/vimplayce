local M = {}

-- global reload configuration 
-- https://www.reddit.com/r/neovim/comments/puuskh/comment/he5vnqc/?utm_source=share&utm_medium=web2x&context=3
function M.reaload_config()
    for name in pairs(package.loaded) do
	if name:match('^vimplayce') then
	    package.loaded[name] = nil
	end
    end

    dofile(vim.env.MYVIMRC)
end

return M
