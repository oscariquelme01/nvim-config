vim.wo.number = true                   -- Make line numbers default
-- vim.wo.relativenumber = true           -- Relative line numbers
vim.o.mouse = 'a'                      -- Enable mouse mode
vim.o.clipboard = 'unnamedplus'        -- Sync clipboard between OS and Neovim.
vim.o.breakindent = true               -- Enable break indent
vim.o.undofile = true                  -- Save undo history
vim.o.ignorecase = true                -- Case-insensitive searching UNLESS \C or capital in search
vim.o.smartcase = true
vim.wo.signcolumn = 'yes'              -- Keep signcolumn on by default
vim.o.updatetime = 250                 -- Decrease update time
vim.o.timeoutlen = 300
vim.o.completeopt = 'menuone,noselect' -- Set completeopt to have a better completion experience
vim.o.splitbelow = true                -- Horizontal split below current buffer
vim.o.splitright = true                -- Vertical split right to current buffer
vim.o.tabstop = 4                      -- Tabstop default is 8 spaces...
vim.o.shiftwidth = 4                   -- What the fuck are even these default setting on god
vim.o.scrolloff = 3                    -- Lines to keep above or below the cursor when scrolling
