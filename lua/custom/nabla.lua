local nabla = require("nabla")
nabla.enable_virt({
    autogen = true, -- auto-regenerate ASCII art when exiting insert mode
    silent = true, -- silents error messages
})
-- Setup a keybinding
vim.keymap.set('n', '<Leader>m', require("nabla").popup, { remap = false })
