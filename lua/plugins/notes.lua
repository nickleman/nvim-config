return {
	"nvim-neorg/neorg",
	build = ":Neorg sync-parsers",
	-- tag = "*",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("neorg").setup {
			load = {
				["core.defaults"] = {}, -- Loads default behaviour
				["core.concealer"] = {}, -- Adds pretty icons to your documents
				["core.summary"] = {}, -- Adds autogeneration of summaries
				["core.dirman"] = { -- Manages Neorg workspaces
					config = {
						default_workspace = "notes",
						workspaces = {
							notes = "c:\\Users\\210008146\\Documents\\Notes",
						},
					},
				},
			},
		}
	end,
}
