return {
	"goolord/alpha-nvim",
	dependencies = {
		"nvim-mini/mini.icons",
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		dashboard.section.header.val = {
			[[                                                    -         ]],
			[[                     :........                      =         ]],
			[[                     ..::::.:.::                   --         ]],
			[[                     =**#**##*-::                  -+         ]],
			[[                     **+=+++*%%#=                ::-+         ]],
			[[                     +==-+=++=**            .:::--==          ]],
			[[                      --=+-==-=        ......--==             ]],
			[[                    ::---===-*:............:::                ]],
			[[                  ....::+**=::--:....:.::::::                 ]],
			[[               .:...--:.:::-:*::-.:::.::::-                   ]],
			[[              :.-=-:::....:%=:::--:::::-                      ]],
			[[             ...:.:::-+...#::-:+---:                          ]],
			[[             .:..:..:::=.:::+:-=-=                            ]],
			[[            ....-###-::-#=-*::#::+                            ]],
			[[           ..:.:-:===---*=+:-**-*                             ]],
			[[          ....:.::::-=-:%=:-**-*#                             ]],
			[[          .::::*:::++=:+#:-*+-*#                              ]],
			[[         ...-::*.:::#:+%==:-:::#                              ]],
			[[         ....##:-::::#%%%#*.+###                              ]],
			[[         ....%%%%%%%%#%%%%%%%%#                               ]],
			[[          -:%%%%%%%%%%%%%###%%                                ]],
			[[           +%%%%%%#%%%%%%%%%%%                                ]],
			[[           %%%%%%#%%%%%%%%%%%%                                ]],
			[[           %%%%%%%%%#%%%%%####                                ]],
			[[           %%%%#%%%%%%#%%%%%%                                 ]],
			[[           %%%#%%%%%%######%%                                 ]],
			[[          %%%#%%%%%%%%%#%%%%#                                 ]],
			[[          %#%%%%%%%%#%####%%                                  ]],
			[[         %%%%%%%%%%%######%%                                  ]],
		}

		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		dashboard.section.header.val = require("ascii.me")

		dashboard.section.buttons.val = {
			dashboard.button("f", "󰱼  Find file", ":Telescope find_files<CR>"),
			dashboard.button("r", "󰄉  Recent files", ":Telescope oldfiles<CR>"),
			dashboard.button("g", "󰊄  Find text", ":Telescope live_grep<CR>"),
			dashboard.button("n", "  New file", ":ene <BAR> startinsert<CR>"),
			dashboard.button("c", "  Config", ":e $MYVIMRC<CR>"),
			dashboard.button("q", "󰅚  Quit", ":qa<CR>"),
		}

		alpha.setup(dashboard.config)

		alpha.setup(dashboard.config)
	end,
}
