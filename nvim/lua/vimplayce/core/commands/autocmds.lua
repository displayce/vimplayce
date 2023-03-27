local autocmd = vim.api.nvim_create_autocmd

autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({ higroup = "Yellow", timeout = 250 })
	end,
})

autocmd("BufWritePre", {
	pattern = {
		-- add path/file patterns here that shouldn't have a undofile
		"/tmp/*",
	},
	command = "setlocal noundofile",
})

autocmd("VimEnter", {
	callback = function(data)
		local is_directory = vim.fn.isdirectory(data.file) == 1
		if not is_directory then
			return
		end

		vim.cmd.enew()
		vim.cmd.bw(data.buf)
		vim.cmd.cd(data.file)
		require("nvim-tree.api").tree.open()
	end,
})
