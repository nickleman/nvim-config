return {
    "jbyuki/nabla.nvim",
    ft = { "markdown", "tex", "latex", "norg", "org" },
    config = function()
        require("custom.nabla")
    end,
}
