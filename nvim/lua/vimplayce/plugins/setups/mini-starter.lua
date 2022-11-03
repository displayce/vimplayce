return function()
	local starter = require('mini.starter')
	starter.setup({
		header = ' █ █ █ █▄ ▄█ █▀▄ █   ▄▀▄ ▀▄▀ ▄▀▀ ██▀\n ▀▄▀ █ █ ▀ █ █▀  █▄▄ █▀█  █  ▀▄▄ █▄▄\n',
		footer = 'Nvim is open source and freely distributable.\n\tVisit: https://neovim.io/sponsors\n\nVim is charityware. Help children in Uganda!\n\tVisit: https://vim.org/sponsor\n\nFor more information about vim\'s charity\n\t\ttype :help iccf<Enter>',
		items = {
			{
				{ section = 'Buffer', name = 'New buffer', action = 'enew' },
				{
					section = 'Buffer',
					name = 'Open file',
					action = function()
						local file = vim.fn.input({
							prompt = 'Choose a file : ',
							completion = 'file',
						})

						if file == '' then return end

						vim.cmd('e ' .. file)
					end
				},
				{ section = 'Buffer', name = 'Quit', action = 'cq' },
			},
			{
				{
					section = 'Plugin manager',
					name = 'Install',
					action = function()
						local on_enter = function(_, idx)
							local config_path = vim.api.nvim_list_runtime_paths()[1] .. '/lua/plugins/'
							if idx == 1 then
								vim.cmd('e ' .. config_path .. 'lsp.lua')
							else
								vim.cmd('e ' .. config_path .. 'user.lua')
							end
						end

						vim.ui.select(
							{
								'LSP',
								'User'
							},
							{ prompt = 'Plugin type : ' },
							on_enter
						)
					end
				},
				{
					section = 'Plugin manager',
					name = 'Compile',
					action = function()
						local packer = package.loaded.packer
						vim.notify('Compiling packer.')
						packer.compile()
					end
				},
				{
					section = 'Plugin manager',
					name = 'Sync',
					action = function()
						local packer = package.loaded.packer
						vim.notify('Syncing packer.')
						packer.sync()
					end
				},
			},
			starter.sections.recent_files(8, true, true),
		},
		content_hooks = {
			starter.gen_hook.adding_bullet(' ', true),
			starter.gen_hook.aligning('center', 'center'),
		}
	})
end
