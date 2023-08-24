return {
	-- theme
	{
		"sainnhe/everforest",
		config = function() vim.cmd("colorscheme everforest") end,
	},

	-- main
	-- no setup
	"gpanders/nvim-parinfer",
	"sheerun/vim-polyglot",
	"hylang/vim-hy",
	"teal-language/vim-teal",
	-- simple setup
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
		"nacro90/numb.nvim",
		config = function() require("numb").setup({}) end,
	},

	-- complex setups
	{
		"echasnovski/mini.statusline",
		requires = {
			"nvim-tree/nvim-web-devicons",
		},
		branch = "stable",
		config = require("vimplayce.plugins.setups.mini-statusline"),
	},
	{
		"lewis6991/gitsigns.nvim",
		config = require("vimplayce.plugins.setups.gitsigns"),
	},
	{
		"Olical/conjure",
		config = require("vimplayce.plugins.setups.conjure"),
	},
}
