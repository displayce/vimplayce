return function()
	local attach = require("vimplayce.plugins.lsp.attach")
	local null_ls = require("null-ls")

	null_ls.setup({
		on_attach = attach,
		sources = {
			-- formatting
			null_ls.builtins.formatting.sqlfmt,
			null_ls.builtins.formatting.stylua,
			null_ls.builtins.formatting.black.with({
				extra_args = { "--line-length", "150" },
			}),
			-- diagnostics
			null_ls.builtins.diagnostics.shellcheck,
			null_ls.builtins.diagnostics.mypy,
			null_ls.builtins.diagnostics.ruff.with({
				extra_args = {
					"--line-length",
					"150",
					"--extend-select",
					"A,B,BLE,C,N,RUF,U,YTT",
					"--extend-ignore",
					"C90,B008,U007",
				},
			}),
			null_ls.builtins.diagnostics.teal,
		},
	})
end
