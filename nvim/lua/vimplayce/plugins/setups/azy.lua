return function()
	require("azy").setup({
		debug = false,
		preview = true,
		mappings = {
			["<C-P>"] = "prev",
			["<C-N>"] = "next",
			["<CR>"] = "confirm",
			["<C-V>"] = "confirm_vsplit",
			["<C-H>"] = "confirm_split",
		},
	})
	vim.ui.select = require("azy.builtins").select
end
