return {
	'polarmutex/git-worktree.nvim',
	-- branch = "v2",
	dependencies = { 'nvim-lua/plenary.nvim', 'vim-telescope/telescope.nvim', },

	config = function()
        require("custom.git-worktree")
	end,
}
