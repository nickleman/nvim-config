return {
    'chrisgrieser/nvim-origami',
    event = "VeryLazy",
    opts = {
        foldtext = {
            lineCount = {
                template = " %d"
            }
        }
    },
    init = function()
        require("custom.nvim-origami")
    end
}
