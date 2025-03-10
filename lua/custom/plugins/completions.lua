return {
    'hrsh7th/nvim-cmp',
    lazy = false,
    -- event = { "BufReadPre", "BufNewFile" },
    -- event = { "InsertEnter" }, -- "BufReadPre", "BufNewFile" },
    priority = 100,
    dependencies = {
        'onsails/lspkind.nvim',
        'L3MON4D3/LuaSnip',
        build = (function()
            -- Build step is needed for regex support in snippets.
            -- This step is not supported in many windows environments.
            -- Remove the below condition to re-enable on windows.
            if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
                return
            end
            return 'make install_jsregexp'
        end)(),
        dependencies = {
            -- `friendly-snippets` contains a variety of premade snippets.
            --  See the README about individual language/framework/plugin
            --  snippets. https://github.com/rafamadriz/friendly-snippets
            config = function()
                require('luasnip.loaders.from_vscode').lazy_load()
            end,
        },
        'rafamadriz/friendly-snippets',
        'saadparwaiz1/cmp_luasnip',

        -- Adds other completion capabilities.
        --  nvim-cmp does not ship with all sources by default. They are
        --  split into multiple repos for maintenance purposes.
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-path',
        -- Add Github Copilot
        -- 'github/copilot.vim',
        {
            'zbirenbaum/copilot.lua',
            cmd = "Copilot",
            event = "InsertEnter",
            config = function()
                require('copilot').setup()
            end,
        },
        {
            "zbirenbaum/copilot-cmp",
            config = function()
                require("copilot_cmp").setup()
            end,
        },
    },
    config = function()
        require("custom.completions")
    end,
}
