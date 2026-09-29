return {
  {
    "mason-org/mason.nvim",
    opts = {},
  },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = {
      "mason-org/mason.nvim",
    },
    opts = {
      ensure_installed = {
        -- Formatters
        "stylua",
        "prettierd",

        -- Linters
        "shellcheck",

        -- TODO: curate this list!
      },
    },
  },
}
