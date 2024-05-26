return {
    'nvim-telescope/telescope.nvim', -- Alternate file browser
    branch = '0.1.x',
    dependencies = {
        'nvim-lua/plenary.nvim',

        'nvim-telescope/telescope-ui-select.nvim',

        -- Useful for getting pretty icons, but requires a Nerd Font.
        { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font }
    },
    config = function()
        require("custom.telescope")
    end,
}
