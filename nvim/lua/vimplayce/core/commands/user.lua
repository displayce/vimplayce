local user_command = vim.api.nvim_create_user_command

-- TODO: could be better, might get stuck
-- TODO: should be able to take a range argument
user_command("Grep", function(tbl)
	local word = tbl.args
	if tbl.bang or word == "" then
		word = vim.fn.expand("<cword>")
	end

	local lines = vim.fn.systemlist("grep -nR " .. word)
	vim.fn.setqflist({}, "r", {
		title = "Grep " .. word,
		lines = lines,
		efm = "%f:%l:%m",
	})
end, {
	nargs = "?",
	bang = true,
})

user_command("Date", function(_)
	local date = os.date("# %d-%m-%Y", os.time())
	local row = vim.api.nvim_win_get_cursor(0)[1]
	vim.api.nvim_buf_set_lines(0, row, row, true, {date})
end, {})
