return {
	'nvim-telescope/telescope.nvim', -- Alternate file browser
	branch = '0.1.x',
	dependencies = {
		'nvim-lua/plenary.nvim',

		'nvim-telescope/telescope-ui-select.nvim',

		-- Useful for getting pretty icons, but requires a Nerd Font.
		{ 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font }
	},
	config = function()
		-- Telescope is a fuzzy finder that comes with a lot of different things that
		-- it can fuzzy find! It's more than just a "file finder", it can search
		-- many different aspects of Neovim, your workspace, LSP, and more!
		--
		-- The easiest way to use Telescope, is to start by doing something like:
		--  :Telescope help_tags
		--
		-- After running this command, a window will open up and you're able to
		-- type in the prompt window. You'll see a list of `help_tags` options and
		-- a corresponding preview of the help.
		--
		-- Two important keymaps to use while in Telescope are:
		--  - Insert mode: <c-/>
		--  - Normal mode: ?
		--
		-- This opens a window that shows you all of the keymaps for the current
		-- Telescope picker. This is really useful to discover what Telescope can
		-- do as well as how to actually do it!

		-- [[ Configure Telescope ]]
		-- See `:help telescope` and `:help telescope.setup()`		local builtin = require('telescope.builtin')
		require('telescope').setup {
			-- You can put your default mappings / updates / etc. in here
			--  All the info you're looking for is in
			--  ':help telescope.setup()'
			--
			-- defaults = {
			--     mappings = {
			--         i = { ['<C-Enter>'] = 'to_fuzzy_refine' },
			--     },
			-- },
			-- pickers = {}
			extensions = {
				['ui-select'] = {
					require('telescope.themes').get_dropdown(),
				},
			},
		}

		-- Enable Telescope extensions if they are installed
		-- pcall(require('telescope').load_extension('fzf'))
		pcall(require('telescope').load_extension('ui-select'))

		-- See :help telescope.builtin
		local builtin = require('telescope.builtin')
		vim.keymap.set('n', '<Leader>ff', builtin.find_files,
			{ desc = '[f]uzzy find [f]iles' })
		vim.keymap.set('n', '<Leader>f.', builtin.oldfiles,
			{ desc = '[f]uzzy find recent files ("." for repeat)' })
		vim.keymap.set('n', '<Leader>fg', builtin.live_grep,
			{ desc = '[f]uzzy find by [g]rep' })
		vim.keymap.set('n', '<Leader>fh', builtin.help_tags,
			{ desc = '[f]uzzy find [h]elp' })
		vim.keymap.set('n', '<Leader>fk', builtin.keymaps,
			{ desc = '[f]uzzy find [k]eymaps' })
		vim.keymap.set('n', '<Leader>fs', builtin.builtin,
			{ desc = '[f]uzzy find [s]elect Telescope' })
		vim.keymap.set('n', '<Leader>fw', builtin.grep_string,
			{ desc = '[f]uzzy find current [w]ord' })
		vim.keymap.set('n', '<Leader>fd', builtin.diagnostics,
			{ desc = '[f]uzzy find [d]iagnostics' })
		vim.keymap.set('n', '<Leader>fr', builtin.resume,
			{ desc = '[f]uzzy find [r]esume' })
		vim.keymap.set('n', '<Leader><Leader>', builtin.buffers,
			{ desc = '[ ] Fuzzy find existing buffers' })

		-- Slightly advanced example of overriding default behavior and theme
		vim.keymap.set('n', '<leader>/', function()
			-- You can pass additional configuration to Telescope to change the theme, layout, etc.
			builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
				winblend = 10,
				previewer = false,
			})
		end, { desc = '[/] Fuzzily search in current buffer' })

		-- It's also possible to pass additional configuration options.
		--  See `:help telescope.builtin.live_grep()` for information about particular keys
		vim.keymap.set('n', '<leader>f/', function()
			builtin.live_grep {
				grep_open_files = true,
				prompt_title = 'Live Grep in Open Files',
			}
		end, { desc = '[f]uzzy find [/] in Open Files' })

		-- Shortcut for fuzzy finding my Neovim configuration files
		vim.keymap.set('n', '<Leader>fc', function()
			builtin.find_files { cwd = vim.fn.stdpath 'config' }
		end, { desc = '[f]uzzy find neovim [c]onfig files' })

		-- Shortcut for fuzzy finding my Notes files
		vim.keymap.set('n', '<Leader>fn', function()
			builtin.find_files { cwd = '~/Documents/Notes' }
		end, { desc = '[f]uzzy find [n]ote files' })
	end,
}
