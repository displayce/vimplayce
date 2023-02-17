local filetype_group = vim.api.nvim_create_augroup("UserFiletypeCmd", { clear = true })

local function filetype_autocmd(filetype, callback)
	local ft_pattern = type(filetype) == "table" and filetype or { filetype }
	local opts = {
		group = filetype_group,
		pattern = ft_pattern,
	}

	local cb = type(callback)
	if cb == "string" then
		opts["command"] = callback
	elseif cb == "function" then
		opts["callback"] = callback
	else
		return log.error "error while creating filetype autocmd, callback is neither string nor function"
	end

	vim.api.nvim_create_autocmd("Filetype", opts)
end

filetype_autocmd({ "markdown", "gitcommit", "mail" }, "set spell")
