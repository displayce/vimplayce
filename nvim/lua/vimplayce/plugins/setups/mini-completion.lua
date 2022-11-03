return function()
	local cmpl = require('mini.completion')

	cmpl.setup({
		lsp_completion = {
			source_func = 'omnifunc',
			auto_setup = false,
		},
	})
end
