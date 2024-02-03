require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "dockerls", "docker_compose_language_service", "jedi_language_server", } --"tailwindcss-language-server" }
})

local on_attach = function(_, _)
	vim.keymap.set('n', 'rn', vim.lsp.buf.rename, {})
	vim.keymap.set('n', 'ca', vim.lsp.buf.code_action, {})

	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
	vim.keymap.set('n', '<Leader>gr', require('telescope.builtin').lsp_references, {})
	vim.keymap.set('n', '<Leader>K', vim.lsp.buf.hover, {})
end

vim.api.nvim_create_user_command("Format", function()
	vim.lsp.buf.format()
end, {})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("lspconfig").lua_ls.setup({
	on_attach = on_attach,
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

require("lspconfig").dockerls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

require("lspconfig").docker_compose_language_service.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

require("lspconfig").jedi_language_server.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

require('lspconfig').ruff_lsp.setup {
	-- on_attach = on_attach,
	init_options = {
		settings = {
			-- Any extra CLI arguments for `ruff` go here.
			args = {},
		}
	},
	-- Setup autoformat on save
	vim.api.nvim_create_autocmd("BufWritePre", {
		callback = function()
			vim.lsp.buf.format()
		end,
	})
}
