return {
  "ibhagwan/fzf-lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },

  config = function()
    local fzf = require("fzf-lua")
    local keymap = vim.keymap.set

    fzf.setup({
      "borderless",

      -- Make it inherit Vesper/Neovim instead of fzf-lua's more colorful defaults.
      hls = {
        normal = "Normal",
        preview_normal = "Normal",

        border = "FloatBorder",
        preview_border = "FloatBorder",

        cursorline = "CursorLine",
        cursorlinenr = "CursorLineNr",

        title = "Normal",
        preview_title = "Normal",

        search = "IncSearch",
      },

      winopts = {
        backdrop = 100,
      },

      files = {
        hidden = true,
      },
    })

    keymap("n", "<leader>fv", fzf.git_status, {
      desc = "Search modified files",
    })

    keymap("n", "<leader>ff", fzf.files, {
      desc = "Search files",
    })

    keymap("n", "<leader>fu", fzf.lsp_references, {
      desc = "Search references",
    })

    keymap("n", "<leader>fp", fzf.builtin, {
      desc = "Search fzf-lua pickers",
    })

    keymap("n", "<leader>fh", fzf.helptags, {
      desc = "Search help",
    })

		keymap("n", "<leader>fg", fzf.grep_project, {
			desc = "Search text",
		})

    keymap("n", "<leader>fd", fzf.diagnostics_workspace, {
      desc = "Search diagnostics",
    })

    keymap("n", "<leader>fr", fzf.resume, {
      desc = "Search resume",
    })

    keymap("n", "<leader>fb", fzf.buffers, {
      desc = "Find existing buffers",
    })

    keymap("n", "<leader><space>", function()
      fzf.blines({
        winopts = {
          preview = {
            hidden = true,
          },
        },
      })
    end, {
      desc = "Fuzzily search current buffer",
    })
  end,
}
