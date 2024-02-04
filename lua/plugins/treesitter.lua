return {
	'nvim-treesitter/nvim-treesitter',
	build = ":TSUpdate",
	config = function()
		require('nvim-treesitter.configs').setup {
			-- A list of parser names, or "all"
			ensure_installed = { "c", "lua", "rust", "vim", "html", "css", "javascript", "python" },

			-- Install parsers synchronously (only applied to 'ensure_installed')
			sync_install = false,
			auto_install = true,
			highlight = { enable = true, },
			indent = { enable = true, },
		}
	end
}
