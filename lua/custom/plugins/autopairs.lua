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
        config = function()
            require('nvim-ts-autotag').setup()
        end
    },
}
