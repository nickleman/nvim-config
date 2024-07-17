return {
    'mfussenegger/nvim-dap',
    dependencies = { 'rcarriga/nvim-dap-ui',
        {
            'nvim-neotest/neotest',
            dependencies = {
                'nvim-neotest/nvim-nio',
                'nvim-lua/plenary.nvim',
                -- 'antoinemadec/FixCursorHold.nvim',
                'nvim-treesitter/nvim-treesitter',
                'nvim-neotest/neotest-python',
            }
        },
        'mfussenegger/nvim-dap-python', },
    lazy = true,
    event = { "VeryLazy" },
    config = function()
        require("custom.debugging")
    end
}
