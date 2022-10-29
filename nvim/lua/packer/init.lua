local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local uok, user = pcall(require, 'user')
if not uok then
	vim.notify_once('Couldn\'t load plugins', vim.log.levels.WARN)
	return
end

local lok, lsp = pcall(require, 'lsp')
if not lok then
	vim.notify_once('Couldn\'t load plugins', vim.log.levels.WARN)
	return
end

local packer = require('packer')
return packer.startup(function(use)
	local plugins = vim.list_extend(user, lsp)
	for _, plugin in pairs(plugins) do
		use(plugin)
	end

	if ensure_packer() then
		packer.sync()
	end
end)
