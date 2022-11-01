return {
    -- colorscheme
    'sainnhe/everforest',

    -- simple setup-only plugins
    {
	'echasnovski/mini.cursorword',
	branch = 'stable',
	config = function() require('mini.cursorword').setup {} end
    },
    {
	'echasnovski/mini.comment',
	branch = 'stable',
	config = function() require('mini.comment').setup {} end
    },
    {
	'echasnovski/mini.indentscope',
	branch = 'stable',
	config = function() require('mini.indentscope').setup {} end
    },
    {
	'echasnovski/mini.jump2d',
	branch = 'stable',
	config = function() require('mini.jump2d').setup {} end
    },

    -- plugins with configuration
    {
	'lewis6991/gitsigns.nvim',
	config = function()
	    require('gitsigns').setup({
		signcolumn = false,
		numhl = true,
	    })
	end
    },
    {
	'echasnovski/mini.statusline',
	requires = {
	    'kyazdani42/nvim-web-devicons'
	},
	branch = 'stable',
	config = function()
	    local devicons = require('nvim-web-devicons')
	    require('mini.statusline').setup({
		set_vim_settings = false,
		content = {
		    active = function()
			local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 50 })
			local git           = MiniStatusline.section_git({ trunc_width = 100 })
			local diagnostics   = MiniStatusline.section_diagnostics({ trunc_width = 75 })

			local filename = vim.fn.expand('%:t')
			local extension = vim.fn.expand('%:e')
			local icon = devicons.get_icon(filename, extension, { default = true })

			return MiniStatusline.combine_groups({
			    { hl = mode_hl, strings = { mode } },
			    { hl = 'StatuLineGit', strings = { git } },
			    { hl = 'NonText' },
			    '%=',
			    { hl = 'MiniStatuslineFilename', strings = { filename } },
			    { hl = 'MiniStatuslineDevinfo', strings = { diagnostics } },
			    { hl = 'StatusLineFiletype', strings = { icon, extension } },
			})
		    end
		},
	    })
	end
    },
    {
	'echasnovski/mini.starter',
	branch = 'stable',
	config = function()
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
    },
}
