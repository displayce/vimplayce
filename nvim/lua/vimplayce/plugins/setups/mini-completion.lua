return function()
	require("mini.completion").setup({
		lsp_completion = {
			source_func = "omnifunc",
			auto_setup = false,
		},
	})
	-- prevent the autocompletion popup to shows up every key press
	-- useful when using azy.nvim
	vim.cmd("autocmd! MiniCompletion InsertCharPre *")
end
