-- Set <space> as the leader key
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

local opts = {}
require('lazy').setup({
  { import = 'plugins.theme' },
  { import = 'plugins.ui' },
  { import = 'plugins.completion' },
  { import = 'plugins.languages' },
  { import = 'plugins.utils' },
  { import = 'plugins.lsp.plugins' }
}, opts)

require 'mappings'
require 'options'

-- Require the main lsp file
require 'plugins.lsp'

-- Then load all other LSP configs
local lsp_path = vim.fn.stdpath("config") .. "/lua/plugins/lsp"
for _, file in ipairs(vim.fn.readdir(lsp_path)) do
  if file:match("%.lua$") and file ~= "init.lua" then
    local module_name = "plugins.lsp." .. file:gsub("%.lua$", "")
    require(module_name)
  end
end
