local files = { "autocmds", "filetype", "user" }
for _, file in pairs(files) do
	local ok = pcall(require, "vimplayce.core.commands." .. file)
	if not ok then
		return log.warn("Couldn't load command file", file)
	end
end
