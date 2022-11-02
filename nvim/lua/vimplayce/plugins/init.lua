-- Bootstrapping function
local function ensure_packer()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
	fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
	vim.cmd [[packadd packer.nvim]]
	return true
    end
    return false
end

-- pcall require user/lsp plugins so everything won't crash
local uok, user = pcall(require, 'vimplayce.plugins.user')
if not uok then
    vim.notify([[Couldn't load user plugins]], vim.log.levels.WARN)
    return
end

local lok, lsp = pcall(require, 'vimplayce.plugins.lsp')
if not lok then
    vim.notify([[Couldn't load lsp plugins]], vim.log.levels.WARN)
    return
end

-- bootstrap + require packer
local is_packer_bootstraped = ensure_packer()
local packer = require('packer')

return packer.startup(function(use)
    use 'wbthomason/packer.nvim'

    local plugins = vim.list_extend(user, lsp)
    for _, plugin in pairs(plugins) do
	use(plugin)
    end

    if is_packer_bootstraped then
	-- automatically reload vimplayce configuration
	-- and jump to its homepage.
	vim.api.nvim_create_autocmd('User', {
	    pattern = 'PackerComplete',
	    once = true,
	    callback = function()
		vim.api.nvim_win_close(0, true)
		require('vimplayce.core.utils').reaload_config()
		require('mini.starter').open()
	    end
	})

	-- first sync
	packer.sync()
    end

end)
