return {
	"stevearc/oil.nvim",
	lazy = false,
	dependencies = {
		{ "nvim-mini/mini.icons", opts = {} },
	},
	config = function()
		local oil = require("oil")

		local function open_preview()
			local oil_win = vim.api.nvim_get_current_win()

			-- Empty directories / lines without an entry need no preview.
			if vim.bo.filetype ~= "oil" or not oil.get_cursor_entry() then
				return
			end

			oil.open_preview({
				vertical = true,
				split = "belowright",
			}, function(err)
				if err or not vim.api.nvim_win_is_valid(oil_win) then
					return
				end

				-- Divide the combined width between Oil and its preview.
				local tab = vim.api.nvim_win_get_tabpage(oil_win)
				for _, win in ipairs(vim.api.nvim_tabpage_list_wins(tab)) do
					if vim.wo[win].previewwindow then
						local total_width = vim.api.nvim_win_get_width(oil_win)
							+ vim.api.nvim_win_get_width(win)

						vim.api.nvim_win_set_width(
							oil_win,
							math.max(1, math.floor(total_width * 0.2))
						)
						break
					end
				end
			end)
		end

		oil.setup({
			view_options = {
				show_hidden = true,
			},
			win_options = {
				winbar = "%!v:lua.require('oil').get_current_dir()",
			},
			preview_win = {
				update_on_cursor_moved = true,
			},
			use_default_keymaps = false,
			keymaps = {
				["g?"] = { "actions.show_help", mode = "n" },
				["<CR>"] = "actions.select",
				["<C-r>"] = "actions.refresh",

				["-"] = { "actions.parent", mode = "n" },
				["_"] = { "actions.open_cwd", mode = "n" },
				["`"] = { "actions.cd", mode = "n" },
				["g~"] = {
					"actions.cd",
					opts = { scope = "tab" },
					mode = "n",
				},

				["gs"] = { "actions.change_sort", mode = "n" },
				["gx"] = "actions.open_external",
				["g."] = { "actions.toggle_hidden", mode = "n" },
				["g\\"] = { "actions.toggle_trash", mode = "n" },

				["gp"] = {
					callback = open_preview,
					desc = "Open preview with 20/80 layout",
					mode = "n",
				},
				["q"] = { "actions.close", mode = "n" },
			},
		})

		local function open_oil()
			-- Already browsing: reopen/rebalance the preview.
			if vim.bo.filetype == "oil" then
				open_preview()
				return
			end

			-- Wait until Oil has loaded entries and positioned the cursor.
			oil.open(nil, {}, function()
				open_preview()
			end)
		end

		vim.keymap.set("n", "<leader>fe", open_oil, {
			desc = "Explore files (Oil)",
		})
	end,
}
