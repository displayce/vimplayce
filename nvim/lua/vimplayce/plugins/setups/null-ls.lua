return function()
	local null_ls = require "null-ls"

	-- python builtins with custom cli args

	null_ls.setup({
		sources = {
			-- builtins
			-- formatting
			null_ls.builtins.formatting.stylua,

			-- customs/modified
			-- formatting
			null_ls.builtins.formatting.black.with({
				extra_args = { "--line-length", "150" },
			}),
			-- diagnostics
			null_ls.builtins.diagnostics.ruff.with({
				extra_args = {
					"--line-length",
					"150",
					"--extend-select",
					"A,B,BLE,C,N,RUF,U,YTT",
					"--extend-ignore",
					"B008,U007",
				},
			}),
		},
	})
end
