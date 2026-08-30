return {
    'hrsh7th/nvim-cmp',
    lazy = false,
    -- event = { "BufReadPre", "BufNewFile" },
    -- event = { "InsertEnter" }, -- "BufReadPre", "BufNewFile" },
    priority = 100,
    dependencies = {
        'onsails/lspkind.nvim',
        {
            'L3MON4D3/LuaSnip',
            -- Builds jsregexp, which LuaSnip needs for LSP snippets that use
            --  regex transformations. Optional, but cheap to have.
            build = 'make install_jsregexp',
            -- `friendly-snippets` contains a variety of premade snippets.
            --  See the README about individual language/framework/plugin
            --  snippets. https://github.com/rafamadriz/friendly-snippets
            --  It is loaded by `lazy_load()` in custom/completions.lua.
            dependencies = { 'rafamadriz/friendly-snippets' },
        },
        'saadparwaiz1/cmp_luasnip',

        -- Adds other completion capabilities.
        --  nvim-cmp does not ship with all sources by default. They are
        --  split into multiple repos for maintenance purposes.
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-buffer',
        -- Add co-pilot chat
        {
            'CopilotC-Nvim/CopilotChat.nvim',
            build = "make tiktoken", -- Compiles the tiktoken_core.so library
            dependencies = {
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
                { 'nvim-lua/plenary.nvim'},
            },
            opts = {
            },
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
