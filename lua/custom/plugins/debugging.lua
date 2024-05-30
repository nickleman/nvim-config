return {
    'mfussenegger/nvim-dap',
    dependencies = { 'rcarriga/nvim-dap-ui', 'nvim-neotest/nvim-nio',
        'mfussenegger/nvim-dap-python', },
    lazy = true,
    event = { "VeryLazy" },
    config = function()
        require("custom.debugging")
    end
}
