return {
	'ThePrimeagen/git-worktree.nvim',
	dependencies = { 'nvim-telescope/telescope.nvim', },
	config = function()
		require('git-worktree').setup()
		telescope = require('telescope').load_extension('git_worktree')

		vim.keymap.set('n', '<Leader>gw', require('telescope').extensions.git_worktree.git_worktrees, {})
		vim.keymap.set('n', '<Leader>gW', require('telescope').extensions.git_worktree.create_git_worktree, {})
	end,
}
