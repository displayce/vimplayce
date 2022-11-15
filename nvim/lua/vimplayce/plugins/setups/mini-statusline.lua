return function()
	local devicons = require "nvim-web-devicons"
	require("mini.statusline").setup({
		set_vim_settings = false,
		content = {
			active = function()
				local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 50 })
				local git = MiniStatusline.section_git({ trunc_width = 100 })
				local diagnostics = MiniStatusline.section_diagnostics({ trunc_width = 75 })

				local filename = vim.fn.expand "%:t"
				local extension = vim.fn.expand "%:e"
				local icon = devicons.get_icon(filename, extension, { default = true })

				return MiniStatusline.combine_groups({
					{ hl = mode_hl, strings = { mode } },
					{ hl = "StatuLineGit", strings = { git } },
					{ hl = "NonText" },
					"%=",
					{ hl = "MiniStatuslineFilename", strings = { filename } },
					{ hl = "MiniStatuslineDevinfo", strings = { diagnostics } },
					{ hl = "StatusLineFiletype", strings = { icon, extension } },
				})
			end,
		},
	})
end
