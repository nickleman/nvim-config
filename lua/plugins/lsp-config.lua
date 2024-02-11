return {
	{
		'williamboman/mason.nvim',
		config = function()
			require("mason").setup()
		end
	},
	{
		'williamboman/mason-lspconfig.nvim',
		lazy = false,
		opts = {
			auto_install = true,
		},
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"dockerls",
					"docker_compose_language_service",
					"jedi_language_server",
					"tailwindcss",
					"html",
					"ruff_lsp",
				}
			})
		end
	},
	{
		'neovim/nvim-lspconfig',
		config = function()
			local capabilities = require('cmp_nvim_lsp').default_capabilities()

			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" }
						}
					}
				},
				-- Setup autoformat on save
				vim.api.nvim_create_autocmd("BufWritePre", {
					callback = function()
						vim.lsp.buf.format()
					end,
				})
			})
			lspconfig.dockerls.setup({
				capabilities = capabilities,
			})
			lspconfig.docker_compose_language_service.setup({
				capabilities = capabilities,
			})
			lspconfig.jedi_language_server.setup({
				capabilities = capabilities,
			})
			lspconfig.tailwindcss.setup({
				capabilities = capabilities,
			})
			lspconfig.html.setup({
				capabilities = capabilities,
			})
			lspconfig.ruff_lsp.setup({
				capabilities = capabilities,
				-- Setup autoformat on save
				vim.api.nvim_create_autocmd("BufWritePre", {
					callback = function()
						vim.lsp.buf.format()
					end,
				})
			})
			vim.keymap.set('n', 'rn', vim.lsp.buf.rename, {})
			vim.keymap.set('n', '<Leader>ca', vim.lsp.buf.code_action, {})
			vim.keymap.set('n', '<Leader>cf', vim.lsp.buf.format, {})
			vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
			vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
			vim.keymap.set('n', '<Leader>gr', require('telescope.builtin').lsp_references, {})
			vim.keymap.set('n', '<Leader>cs', require('telescope.builtin').lsp_workspace_symbols, {})
			vim.keymap.set('n', '<Leader>K', vim.lsp.buf.hover, {})
		end,
		vim.api.nvim_create_user_command("Format", function()
			vim.lsp.buf.format()
		end, {})
	}
}
