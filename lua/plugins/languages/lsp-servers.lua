return {
  -- server config provider cause I don't wanna be searching for configs 24/7
  {
    "neovim/nvim-lspconfig",
  },
  -- bridge between mason & lspconfig: ensure_installed provider + removes the need to do 'vim.lsp.enable("<server-name>")'
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
      "saghen/blink.cmp",
    },
    opts = {
      ensure_installed = {
        "lua_ls",
        "ts_ls",
        "vue_ls",
        "html",
        "cssls",
        "tailwindcss",
        "pyright",
        "bashls",
        "marksman",
        "sqlls",
        "texlab",
      },
    },
  },
}
