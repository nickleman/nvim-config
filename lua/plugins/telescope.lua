return {
	{
		'nvim-telescope/telescope.nvim', -- Alternate file browser
		branch = '0.1.x',
		dependencies = { 'nvim-lua/plenary.nvim' },
		config = function()
			local builtin = require('telescope.builtin')

			vim.keymap.set('n', '<Leader>ff', builtin.find_files, {})
			vim.keymap.set('n', '<Leader><Space>', builtin.oldfiles, {})
			vim.keymap.set('n', '<Leader>fg', builtin.live_grep, {})
			vim.keymap.set('n', '<Leader>fh', builtin.help_tags, {})
		end
	},
	{
		'nvim-telescope/telescope-ui-select.nvim',
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown {
						}
					}
				}
			})
			require("telescope").load_extension("ui-select")
		end
	}
}
