return {
	{
		'williamboman/mason.nvim',
		config = function()
			require("mason").setup({
				PATH = "prepend", -- "skip" seems to cause spawning errors.
			})
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
				PATH = "prepend", -- "skip" seems to cause spawning errors.
				ensure_installed = {
					"lua_ls",
					"dockerls",
					"docker_compose_language_service",
					"jedi_language_server",
					"tailwindcss",
					"html",
					"ruff_lsp",
					"emmet_language_server",
					"clangd",
					"marksman",
				}
			})
		end
	},
	{
		'neovim/nvim-lspconfig',
		config = function()
			local capabilities = require('cmp_nvim_lsp').default_capabilities()

			local lspconfig = require("lspconfig")
			on_attach = function()
				-- Setup autoformat on save
				vim.api.nvim_create_autocmd("BufWritePre", {
					callback = function()
						vim.lsp.buf.format()
					end,
				})
			end
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" }
						}
					}
				},
				on_attach = on_attach,
			})
			lspconfig.clangd.setup({
				capabilities = capabilities,
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
			lspconfig.marksman.setup({
				capabilities = capabilities,
			})
			lspconfig.tailwindcss.setup({
				capabilities = capabilities,
				settings = {
					emmetCompletions = true
				},
				init_options = {
					userLanguages = { jinja = "html" }
				},
				filetypes = { "html", "jinja", "htmldjango" }
			})
			lspconfig.html.setup({
				capabilities = capabilities,
				init_options = {
					userLanguages = { jinja = "html" }
				},
				filetypes = { "html", "templ", "htmldjango", "jinja" }
			})
			lspconfig.ruff_lsp.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
			lspconfig.emmet_language_server.setup({
				capabilities = capabilities,
				filetypes = { "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "pug", "typescriptreact", "jinja", "htmldjango" },
				-- Read more about this options in the [vscode docs](https://code.visualstudio.com/docs/editor/emmet#_emmet-configuration).
				-- **Note:** only the options listed in the table are supported.
				init_options = {
					---@type table<string, string>
					includeLanguages = {
						jinja = "html",
						htmldjango = "html"
					},
				},
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
