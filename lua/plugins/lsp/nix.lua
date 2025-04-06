vim.lsp.config.nix = {
  cmd = { "nil" },
  filetypes = { "nix" },
  single_file_support = true,
}

vim.lsp.enable("nix")
