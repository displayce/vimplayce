local L = {}

local function join(...)
	local params = table.pack(...)
	return table.concat(params, ' ')
end

function L.info(...)
	local msg = join(...)
	vim.notify(msg, vim.log.levels.INFO)
end

function L.debug(...)
	local msg = join(...)
	vim.notify(msg, vim.log.levels.DEBUG)
end

function L.warn(...)
	local msg = join(...)
	vim.notify(msg, vim.log.levels.WARN)
end

function L.error(...)
	local msg = join(...)
	vim.notify(msg, vim.log.levels.ERROR)
end

return L
