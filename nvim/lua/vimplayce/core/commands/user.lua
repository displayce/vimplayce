local user_command = vim.api.nvim_create_user_command

user_command(
	"Agrep",
	function(keys) try("silent grep " .. keys["args"] .. " | silent cfirst", "echomsg 'No matches found'")() end,
	{ nargs = "+" }
)

user_command("Date", function(_)
	local date = os.date("# %d-%m-%Y", os.time())
	local row = vim.api.nvim_win_get_cursor(0)[1]
	vim.api.nvim_buf_set_lines(0, row, row, true, { date })
end, {})
