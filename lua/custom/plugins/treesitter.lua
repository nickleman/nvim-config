return {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require("custom.treesitter")
    end
}
