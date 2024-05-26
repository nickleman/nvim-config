return {
    'lewis6991/gitsigns.nvim',            -- git integration
    dependencies = { 'tpope/vim-fugitive' }, -- basic git integration
    lazy = true,
    event = { "BufReadPre" },
    config = function()
        require("custom.git-signs")
    end
}
