return {
  "nanozuki/tabby.nvim",
  lazy = false,
  init = function()
    vim.opt.showtabline = 1 -- Only show with two or more tabs
  end,
  opts = {
    line = function(line)
      return {
        line.tabs().foreach(function(tab)
          return {
            tab.number(),
            tab.name(),
            hl = tab.is_current() and "TabLineSel" or "TabLine",
            margin = " ",
          }
        end),
        line.spacer(),
        hl = "TabLineFill",
      }
    end,
  },
}
