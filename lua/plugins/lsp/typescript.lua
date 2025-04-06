local function set_typescript_keymaps(client, bufnr)
  local keymap = vim.keymap.set

  -- Remove Unused Imports
  keymap('n', '<leader>ri', function ()
      vim.lsp.buf.code_action({
        apply = true,
        context = {
          diagnostics = {},
          ---@diagnostic disable-next-line: assign-type-mismatch
          only = { "source.removeUnusedImports.ts" },
        }
      })
  end,
  { desc = 'Remove unused imports' })

  -- Add Missing Imports
  keymap('n', '<leader>ai', function ()
      vim.lsp.buf.code_action({
        apply = true,
        context = {
          diagnostics = {},
          ---@diagnostic disable-next-line: assign-type-mismatch
          only = { "source.addMissingImports.ts" },
        }
      })
  end,
  { desc = 'Add missing imports' })
end

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("ts_ls.lsp", { clear = true }),
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    local bufnr = args.buf

    if client.name == "typescript" then
      set_typescript_keymaps(client, bufnr)
    end
  end
})

local inlayHints = {
  includeInlayParameterNameHints = "all",
  includeInlayParameterNameHintsWhenArgumentMatchesName = false,
  includeInlayFunctionParameterTypeHints = true,
  includeInlayVariableTypeHints = true,
  includeInlayPropertyDeclarationTypeHints = true,
  includeInlayFunctionLikeReturnTypeHints = true,
  includeInlayEnumMemberValueHints = true,
}

vim.lsp.config.typescript = {
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = { "javascript", "typescript", "typescriptreact", "javascriptreact" },
  root_markers = { 'tsconfig.json', 'package.json', 'jsconfig.json', '.git' },
  settings = {
    typescript = {
      inlayHints = inlayHints,
    },
    javascript = {
      inlayHints = inlayHints,
    }
  },
}

vim.lsp.enable("typescript")
