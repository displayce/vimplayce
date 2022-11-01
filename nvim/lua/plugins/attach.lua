local H = {
    signs = {
	{ severity='Error', text='', hl = 'DiagnosticSignError' },
	{ severity='Warn',  text='', hl = 'DiagnosticSignWarn' },
	{ severity='Info',  text='', hl = 'DiagnosticSignInfo' },
	{ severity='Hint',  text='', hl = 'DiagnosticSignHint' },
    }
}

function H.set_signs()
    for _, sign in pairs(H.signs) do
	vim.fn.sign_define('DiagnosticSign' .. sign.severity, {
	    text = sign.text,
	    texthl = sign.hl,
	})
    end
end

function H.attach(_, bufnr)
    -- set completion function
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.MiniCompletion.completefunc_lsp')

    local map = vim.keymap.set
    local bufopts = { noremap=true, silent=true, buffer=bufnr }

    -- signs
    H.set_signs()
    -- diagnostic
    map('n', '<leader>di', vim.diagnostic.open_float, bufopts)
    map('n', '<leader>dh', vim.diagnostic.goto_prev, bufopts)
    map('n', '<leader>dl', vim.diagnostic.goto_next, bufopts)

    -- lsp
    map('n', '<leader>ld', vim.lsp.buf.definition, bufopts)
    map('n', '<leader>lD', vim.lsp.buf.declaration, bufopts)
    map('n', '<leader>lh', vim.lsp.buf.hover, bufopts)
    map('n', '<leader>li', vim.lsp.buf.implementation, bufopts)
    map('n', '<leader>ls', vim.lsp.buf.signature_help, bufopts)
    map('n', '<leader>lt', vim.lsp.buf.type_definition, bufopts)
    map('n', '<leader>ln', vim.lsp.buf.rename, bufopts)
    map('n', '<leader>lc', vim.lsp.buf.code_action, bufopts)
    map('n', '<leader>lr', vim.lsp.buf.references, bufopts)
    map('n', '<leader>lf', function() vim.lsp.buf.format { async = true } end, bufopts)
end


-- returning on_attach function
-- more info :help vim.lsp.client
return H.attach
