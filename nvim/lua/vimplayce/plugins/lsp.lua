return {
    {
	'echasnovski/mini.completion',
	config = function()
	    local cmpl = require('mini.completion')

	    cmpl.setup({
		lsp_completion = {
		    source_func = 'omnifunc',
		    auto_setup = false,
		},
	    })
	end
    },
    {
	'neovim/nvim-lspconfig',
	config = function()
	    local lspconfig = require('lspconfig')

	    local aok, attach = pcall(require, 'vimplayce.plugins.attach')
	    if not aok then
		vim.notify([[Couldn't load on_attach function.]], vim.log.levels.WARN)
	    end

	    local sok, servers = pcall(require, 'vimplayce.config.servers')
	    if not sok then
		vim.notify([[Couldn't load language servers configuration.]], vim.log.levels.WARN)
		return
	    end

	    for _, server in pairs(servers) do
		local name = server
		local config = { on_attach=attach }

		if type(server) == 'table' then
		    name = server.name
		    config = vim.tbl_deep_extend('force', config, server.config)
		end

		lspconfig[name].setup(config)
	    end
	end,
    }
}
