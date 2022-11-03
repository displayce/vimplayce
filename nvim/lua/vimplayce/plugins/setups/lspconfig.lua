return function()
	local lspconfig = require('lspconfig')

	local aok, attach = pcall(require, 'vimplayce.plugins.lsp.attach')
	if not aok then
		vim.notify([[Couldn't load on_attach function.]], vim.log.levels.WARN)
	end

	local sok, servers = pcall(require, 'vimplayce.plugins.lsp.servers')
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
end
