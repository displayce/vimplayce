local autocmd = vim.api.nvim_create_autocmd

autocmd("TextYankPost", {
	callback = function() vim.highlight.on_yank({ higroup = "Yellow", timeout = 250 }) end,
})

autocmd("BufWritePre", {
	pattern = {
		-- add path/file patterns here that shouldn't have a undofile
		"/tmp/*",
	},
	command = "setlocal noundofile",
})
