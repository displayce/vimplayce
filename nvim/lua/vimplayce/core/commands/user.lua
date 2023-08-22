local user_command = vim.api.nvim_create_user_command

user_command("Agrep", function(keys)
	-- join grepprg with the args passed to Agrep
	local expanded = vim.fn.expandcmd(keys["args"])
	local matches = vim.fn.systemlist(vim.o.grepprg .. " " .. expanded)
	if #matches == 0 then
		vim.api.nvim_echo({ { "No matches found", "Error" } }, true, {})
		return
	end
	vim.fn.setqflist({}, "r", { title = "Agrep", lines = matches })
	vim.cmd("copen")
end, { nargs = "+", complete = "tag" })

user_command("Find", ":find <args>", { nargs = "+", complete = "file_in_path" })

user_command("Date", function(_)
	local date = os.date("# %d-%m-%Y", os.time())
	local row = vim.api.nvim_win_get_cursor(0)[1]
	vim.api.nvim_buf_set_lines(0, row, row, true, { date })
end, {})
