local root_files = {
  '.luarc.json',
  '.luarc.jsonc',
  '.luacheckrc',
  '.stylua.toml',
  'stylua.toml',
  'selene.toml',
  'selene.yml',
  '.git',
}

vim.lsp.config.luals = {
  cmd = { "lua-language-server" },
  root_markers = root_files,
  filetypes = { "lua" },
  single_file_support = true,
  log_level = vim.lsp.protocol.MessageType.Warning,
}

vim.lsp.enable("luals")
