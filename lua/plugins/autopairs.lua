return {
	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		opts = {}, -- this is equalent to setup({}) function
		config = function()
			local npairs = require('nvim-autopairs')
			npairs.setup({
				check_ts = true,
				ts_config = {
					lua = { 'string' },
					javascript = { 'template_string' },
					jinja = false, -- Don't check treesitter in jinja files
				},
				fast_wrap = {},
			})
			-- If you want insert `(` after select function or method item
			local cmp_autopairs = require('nvim-autopairs.completion.cmp')
			local cmp = require('cmp')
			cmp.event:on(
				'confirm_done',
				cmp_autopairs.on_confirm_done()
			)
		end,
	},
	{
		'windwp/nvim-ts-autotag',
		config = function()
			require('nvim-ts-autotag').setup({
				filetypes = {
					'html', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'svelte', 'vue', 'tsx',
					'jsx', 'rescript', 'xml', 'php', 'markdown', 'astro', 'glimmer', 'handlebars', 'hbs', 'jinja' }
			})
		end
	},
}
