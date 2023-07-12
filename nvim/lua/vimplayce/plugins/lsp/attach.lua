local H = {
	signs = {
		{ severity = "Error", text = "", hl = "DiagnosticSignError" },
		{ severity = "Warn", text = "", hl = "DiagnosticSignWarn" },
		{ severity = "Info", text = "", hl = "DiagnosticSignInfo" },
		{ severity = "Hint", text = "", hl = "DiagnosticSignHint" },
	},
}

function H.set_signs()
	for _, sign in pairs(H.signs) do
		vim.fn.sign_define("DiagnosticSign" .. sign.severity, {
			text = sign.text,
			texthl = sign.hl,
		})
	end
end

function H.attach(client, bufnr)
	-- set completion function
	local ls_client_capabilities = client.server_capabilities
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
	if client.name ~= "null-ls" and ls_client_capabilities["completionProvider"] then
		vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.MiniCompletion.completefunc_lsp")
	end

	local map = vim.keymap.set
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	-- signs
	H.set_signs()
	-- diagnostic
	map("n", "<leader>di", vim.diagnostic.open_float, bufopts)
	map("n", "<leader>dh", vim.diagnostic.goto_prev, bufopts)
	map("n", "<leader>dl", vim.diagnostic.goto_next, bufopts)

	-- lsp
	local capabilities_to_bind = {
		{ mapping = "<leader>ld", check = "definitionProvider", func = vim.lsp.buf.definition },
		{ mapping = "<leader>lD", check = "declarationProvider", func = vim.lsp.buf.declaration },
		{ mapping = "<leader>lh", check = "hoverProvider", func = vim.lsp.buf.hover },
		{ mapping = "<leader>li", check = "implementationProvider", func = vim.lsp.buf.implementation },
		{ mapping = "<leader>ls", check = "signatureHelpProvider", func = vim.lsp.buf.signature_help },
		{ mapping = "<leader>lt", check = "typeDefinitionProvider", func = vim.lsp.buf.type_definition },
		{ mapping = "<leader>ln", check = "renameProvider", func = vim.lsp.buf.rename },
		{ mapping = "<leader>lc", check = "codeActionProvider", func = vim.lsp.buf.code_action },
		{ mapping = "<leader>lr", check = "referencesProvider", func = vim.lsp.buf.references },
		{
			mapping = "<leader>lf",
			check = "documentFormattingProvider",
			func = function() vim.lsp.buf.format({ async = true }) end,
		},
	}
	for _, binding in pairs(capabilities_to_bind) do
		if ls_client_capabilities[binding.check] then
			map("n", binding.mapping, binding.func, bufopts)
		end
	end
end

-- returning on_attach function
-- more info :help vim.lsp.client
return H.attach
