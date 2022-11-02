for _, import in pairs({
	'plugins',
	'config',
}) do
	require('vimplayce.' .. import)
end
