-- CLIENT CAPABILITES

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend("force",
	capabilities,
	require('cmp_nvim_lsp').default_capabilities(capabilities)
)

-- disable formatting in favour of a standalone formatter
capabilities.documentFormattingProvider = false
capabilities.documentRangeFormattingProvider = false

-- DIAGNOSTICS
local function configure_diagnostics()
  vim.diagnostic.config({
    virtual_text = { current_line = true },
    underline = true,
    update_in_insert = true,
    severity_sort = true,
    signs = {
      text = {
        [vim.diagnostic.severity.ERROR] = "",
        [vim.diagnostic.severity.WARN]  = "",
        [vim.diagnostic.severity.INFO]  = "",
        [vim.diagnostic.severity.HINT]  = "",
      },
    },
    float = {
      source = "if_many",
    },
  })
end

-- The equivalent to the old 'onAttach' callback
-- This event handler will be run everytime an lsp server is attached to a buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('global.lsp', { clear = true }),
  callback = function(args)
	local keymap = vim.keymap.set
	-- Set keymap
	keymap('n', '<leader>ra', vim.lsp.buf.rename, { desc = '[R]e[n]ame' })
	keymap('n', '<leader>ca', vim.lsp.buf.code_action, { desc = '[C]ode [A]ction' })
	keymap('n', 'gd', vim.lsp.buf.definition, { desc = '[G]oto [D]efinition' })
	keymap('n', 'gr', require('telescope.builtin').lsp_references, { desc = '[G]oto [R]eferences' })
	keymap('n', 'gI', require('telescope.builtin').lsp_implementations, { desc = '[G]oto [I]mplementation' })
	keymap('n', '<leader>D', vim.lsp.buf.type_definition, { desc = 'Type [D]efinition' })
	keymap('n', '<leader>ds', require('telescope.builtin').lsp_document_symbols, { desc = '[D]ocument [S]ymbols' })
	keymap('n', '<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, { desc = '[W]orkspace [S]ymbols' })
	keymap('n', 'K', vim.lsp.buf.hover, { desc = 'Hover Documentation' })
	-- Lesser used LSP functionality
	keymap('n', 'gD', vim.lsp.buf.declaration, { desc = '[G]oto [D]eclaration' })
	keymap('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, { desc = '[W]orkspace [A]dd Folder' })
	keymap('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, { desc = '[W]orkspace [R]emove Folder' })
	keymap('n', '<leader>wl', function()

    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, { desc = '[W]orkspace [L]ist Folders' })
    configure_diagnostics()
  end
})

vim.lsp.config('*', {
  capabilities = capabilities
})
