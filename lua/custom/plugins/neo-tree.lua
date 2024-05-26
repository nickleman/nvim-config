return {
    'nvim-neo-tree/neo-tree.nvim', -- file navigator
    branch = "v3.x",
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons', -- Developer Icons
        'MunifTanjim/nui.nvim',
    },
    config = function()
        require("custom.neo-tree")
    end
}
