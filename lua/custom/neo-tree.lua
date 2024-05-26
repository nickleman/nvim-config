-- If you want icons for diagnostic errors, you'll need to define them somewhere:
vim.fn.sign_define("DiagnosticSignError",
    { text = " ", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn",
    { text = " ", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo",
    { text = " ", texthl = "DiagnosticSignInfo" })

require("neo-tree").setup({
    close_if_last_window = true,         -- Close Neo-tree if it is the last window left in the tab
    window = {
        width = 30,
    }
})

vim.keymap.set('n', '<C-t>', ':Neotree toggle<CR>')
vim.keymap.set('n', '<Leader>tt', ':Neotree focus<CR>')
