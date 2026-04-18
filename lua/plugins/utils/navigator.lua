local keymap = vim.api.nvim_set_keymap

return {
  "numToStr/navigator.nvim",
  lazy = false,
  cmd = { "NavigatorLeft", "NavigatorRight", "NavigatorUp", "NavigatorDown" },
  config = function()
    require("Navigator").setup({ disable_on_zoom = true })

    keymap("n", "<D-h>", "<cmd>NavigatorLeft<CR>", { noremap = true, silent = true })
    keymap("n", "<D-j>", "<cmd>NavigatorDown<CR>", { noremap = true, silent = true })
    keymap("n", "<D-k>", "<cmd>NavigatorUp<CR>", { noremap = true, silent = true })
    keymap("n", "<D-l>", "<cmd>NavigatorRight<CR>", { noremap = true, silent = true })
  end,
}
