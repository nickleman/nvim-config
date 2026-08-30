return {
    {
        'windwp/nvim-autopairs',
        lazy = true,
        event = "InsertEnter",
        opts = {}, -- this is equivalent to setup({}) function
        config = function()
            require("custom.autopairs")
        end,
    },
    {
        'windwp/nvim-ts-autotag',
        -- setup() is deprecated in favor of the declarative opts table.
        opts = {},
    },
}
