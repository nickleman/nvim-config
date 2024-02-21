return {
	'nvim-treesitter/nvim-treesitter',
	build = ":TSUpdate",
	event = { "BufReadPre", "BufNewFile"},
	config = function()
		require('nvim-treesitter.configs').setup {
            if vim.loop.os_uname().sysname == "Windows_NT" then
                require('nvim-treesitter.install').compilers = { "clang" }
            end
			-- A list of parser names, or "all"
			ensure_installed = { "c", "lua", "rust", "vim", "html", "css",
				"javascript", "python", "vimdoc", "query" },

			-- Install parsers synchronously (only applied to 'ensure_installed')
			sync_install = false,
			auto_install = true,
			highlight = { enable = true, },
			indent = { enable = true, },
			incremental_selection = {
				enable = true,
			keymaps = {
				init_selection = "<Leader>ss",
				node_incremental = "<Leader>si",
				scope_incremental = "<Leader>s>",
				node_decremental = "<Leader>sd",
			},
			},
		}
	end
}
