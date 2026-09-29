-- Diagnostics 
local config = {
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.HINT] = "",
      [vim.diagnostic.severity.INFO] = "",
    },
  },
  update_in_insert = false,
  underline = true,
  severity_sort = true,
  float = {
    focusable = false,
    style = "minimal",
    border = "single",
    source = "always",
    header = "",
    prefix = "",
    suffix = "",
  },
}
vim.diagnostic.config(config)

-- Improve LSPs UI 
local icons = {
  Class = " ",
  Color = " ",
  Constant = " ",
  Constructor = " ",
  Enum = " ",
  EnumMember = " ",
  Event = " ",
  Field = " ",
  File = " ",
  Folder = " ",
  Function = "󰊕 ",
  Interface = " ",
  Keyword = " ",
  Method = "ƒ ",
  Module = "󰏗 ",
  Property = " ",
  Snippet = " ",
  Struct = " ",
  Text = " ",
  Unit = " ",
  Value = " ",
  Variable = " ",
}

local completion_kinds = vim.lsp.protocol.CompletionItemKind
for i, kind in ipairs(completion_kinds) do
  completion_kinds[i] = icons[kind] and icons[kind] .. kind or kind
end

-- Lsp capabilities and on_attach 
-- Here we grab default Neovim capabilities and extend them with ones we want on top
local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.foldingRange = {
  dynamicRegistration = true,
  lineFoldingOnly = true,
}

capabilities.textDocument.semanticTokens.multilineTokenSupport = true
capabilities.textDocument.completion.completionItem.snippetSupport = true

vim.lsp.config("*", {
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    local ok, diag = pcall(require, "rj.extras.workspace-diagnostic")
    if ok then
      diag.populate_workspace_diagnostics(client, bufnr)
    end
  end,
})

-- Disable the default keybinds 
for _, bind in ipairs({ "grn", "gra", "gri", "grr" }) do
  pcall(vim.keymap.del, "n", bind)
end

-- Create keybindings, commands, inlay hints and autocommands on LSP attach {{{
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local bufnr = ev.buf
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if not client then
      return
    end

    -- All the keymaps
    local keymap = vim.keymap.set
    local lsp = vim.lsp
    local opts = { silent = true }
    local function opt(desc, others)
      return vim.tbl_extend("force", opts, { desc = desc }, others or {})
    end
    keymap("n", "gd", lsp.buf.definition, opt("Go to definition"))
    keymap("n", "gi", function() lsp.buf.implementation({ border = "single" })  end, opt("Go to implementation"))
    keymap("n", "gr", lsp.buf.references, opt("Show References"))
    keymap("n", "<leader>ra", vim.lsp.buf.rename, { buffer = bufnr, silent = true, desc = "Rename symbol" })
    keymap({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr, silent = true, desc = "Code action" })
    keymap("n", "K", vim.lsp.buf.hover, { buffer = bufnr, silent = true, desc = "Hover documentation" })

    -- diagnostic mappings
    keymap("n", "<Leader>de", vim.diagnostic.open_float, opt("Open diagnostic in float"))
    keymap("n", "<Leader>dD", vim.lsp.buf.workspace_diagnostics, opt("Popluate diagnostic for the whole workspace"))
    keymap("n", "<Leader>dn", function() vim.diagnostic.jump({ count = 1, float = true }) end, opt("Next Diagnostic"))
    keymap("n", "<Leader>dp", function() vim.diagnostic.jump({ count =-1, float = true }) end, opt("Prev Diagnostic"))
    keymap("n", "<Leader>dq", vim.diagnostic.setloclist, opt("Set LocList"))
    keymap("n", "<Leader>dv", function()
      vim.diagnostic.config({ virtual_lines = not vim.diagnostic.config().virtual_lines })
    end, opt("Toggle diagnostic virtual_lines"))
  end,
})
