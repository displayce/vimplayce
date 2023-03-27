-- Bootstrapping function
local function ensure_packer()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })

		-- automatically reload vimplayce configuration when
		-- syncing packer and jump to homepage.
		vim.api.nvim_create_autocmd("User", {
			pattern = "PackerComplete",
			-- MAYBE: remove the once so when packer is synced, the whole config reload
			once = true,
			callback = function()
				vim.api.nvim_win_close(0, true)
				for name in pairs(package.loaded) do
					if name:match("^vimplayce") then
						package.loaded[name] = nil
					end
				end

				dofile(vim.env.MYVIMRC)
				require("mini.starter").open(1)
			end,
		})

		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local is_packer_bootstraped = ensure_packer()
local packer = require("packer")

packer.startup(function(use)
	use("wbthomason/packer.nvim")

	local ok, plugins = pcall(require, "vimplayce.plugins")
	if not ok then
		return log.error([[Couldn't load vimplayce's plugins]])
	end

	for _, plugin in pairs(plugins) do
		use(plugin)
	end

	if is_packer_bootstraped then
		-- first sync
		packer.sync()
	end
end)
