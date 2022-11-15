return {
	-- theme
	{
		"sainnhe/everforest",
		config = function() vim.cmd [[colorscheme everforest]] end,
	},

	-- main
	{
		"echasnovski/mini.cursorword",
		branch = "stable",
		config = function() require("mini.cursorword").setup({}) end,
	},
	{
		"echasnovski/mini.comment",
		branch = "stable",
		config = function() require("mini.comment").setup({}) end,
	},
	{
		"echasnovski/mini.indentscope",
		branch = "stable",
		config = function() require("mini.indentscope").setup({}) end,
	},
	{
		"echasnovski/mini.jump2d",
		branch = "stable",
		config = function() require("mini.jump2d").setup({}) end,
	},
	{
		"echasnovski/mini.starter",
		branch = "stable",
		config = require "vimplayce.plugins.setups.mini-starter",
	},
	{
		"echasnovski/mini.statusline",
		requires = {
			"kyazdani42/nvim-web-devicons",
		},
		branch = "stable",
		config = require "vimplayce.plugins.setups.mini-statusline",
	},
	{
		"lewis6991/gitsigns.nvim",
		config = require "vimplayce.plugins.setups.gitsigns",
	},
	{
		"sheerun/vim-polyglot",
	},

	-- lsp related
	{
		"echasnovski/mini.completion",
		branch = "stable",
		config = require "vimplayce.plugins.setups.mini-completion",
	},
	{
		"neovim/nvim-lspconfig",
		config = require "vimplayce.plugins.setups.lspconfig",
	},
}
