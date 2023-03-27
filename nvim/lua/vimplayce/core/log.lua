local M = {}

local function join(...)
	return table.concat({ ... }, " ")
end

function M.info(...)
	local msg = join(...)
	vim.notify(msg, vim.log.levels.INFO)
end

function M.debug(...)
	local msg = join(...)
	vim.notify(msg, vim.log.levels.DEBUG)
end

function M.warn(...)
	local msg = join(...)
	vim.notify(msg, vim.log.levels.WARN)
end

function M.error(...)
	local msg = join(...)
	vim.notify(msg, vim.log.levels.ERROR)
end

return M
