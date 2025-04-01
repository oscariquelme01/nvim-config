return {
  'RRethy/base16-nvim',
  lazy = false,
  priority = 1000,
  config = function()
    -- require('catppuccin').setup {
    --   custom_highlights = function(colors)
    --     return {
    --       TabLineSel = { bg = colors.green },
    --       NvimTreeWinSeparator = { fg = colors.crust },
    --       VertSplit = { fg = colors.crust },
    --
    --       -- Treesitter stuff
    --       ['@variable.member'] = { fg = colors.yellow },
    --       ['@property'] = { fg = colors.yellow },
    --       ['@module'] = { fg = colors.yellow },
    --       ['@variable.parameter'] = { fg = colors.red },
    --
    --       -- Telescope stuff
    --       TelescopeBorder = { fg = colors.base },
    --       TelescopePreviewTitle = { fg = colors.yellow },
    --       TelescopePromptTitle = { fg = colors.yellow },
    --       TelescopeResultsTitle = { fg = colors.yellow },
    --       TelescopePromptNormal = { bg = colors.surface0 },
    --       TelescopePromptPrefix = { bg = colors.surface0 },
    --       TelescopePromptBorder = { fg = colors.surface0, bg = colors.surface0 },
    --       TelescopeSelectionCaret = { fg = colors.yellow },
    --     }
    --   end,
    --   color_overrides = {
    --     all = {
    --       base = '#1e2129',
    --       mantle = '#181a21',
    --       crust = '#181a21',
    --       text = '#d3dae3',
    --       surface1 = '#627a93',
    --       yellow = '#e5c890',
    --       blue = '#61afef',
    --       lavender = '#1d99f3',
    --       green = '#a6d189',
    --       red = '#de6b74',
    --       mauve = '#f488eF'
    --     },
    --   },
    -- }
    vim.o.termguicolors = true -- Use terminal gui colors
    require('base16-colorscheme').setup({ 
      base00 = '#181818', base01 = '#282828', base02 = '#383838', base03 = '#585858',
      base04 = '#b8b8b8', base05 = '#d8d8d8', base06 = '#e8e8e8', base07 = '#f8f8f8',
      base08 = '#de6b74', base09 = '#dc9656', base0A = '#f7ca88', base0B = '#a1b56c',
      base0C = '#86c1b9', base0D = '#7cafc2', base0E = '#ba7baf', base0F = '#a16946'
  })
  end,
}
