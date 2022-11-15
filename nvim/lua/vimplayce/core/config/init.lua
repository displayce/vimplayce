local files = { "keymaps", "highlights", "options" }
for _, file in pairs(files) do
	local ok, _ = pcall(require, "vimplayce.core.config." .. file)
	if not ok then
		return log.warn("Couldn't import core configuration", file, "file")
	end
end
