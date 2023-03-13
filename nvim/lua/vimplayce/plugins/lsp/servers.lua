return {
	"gopls",
	"ocamlls",
	"phpactor",
	"ccls",
	-- "vls", -- not working properly rn

	{
		name = "pylsp",
		config = {
			pylsp = {
				plugins = {
					autopep8 = { enabled = false },
					mccade = { enabled = false },
					pycodestyle = { enabled = false },
					pyflakes = { enabled = false },
					yapf = { enabled = false },
				},
			},
		},
	},
	{
		name = "lua_ls",
		config = {
			Lua = {
				runtime = {
					-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
					version = "LuaJIT",
				},
				diagnostics = {
					-- Get the language server to recognize the `vim` global
					globals = { "vim" },
				},
				workspace = {
					-- Make the server aware of Neovim runtime files
					library = vim.api.nvim_get_runtime_file("", true),
				},
				-- Do not send telemetry data containing a randomized but unique identifier
				telemetry = {
					enable = false,
				},
			},
		},
	},
}
