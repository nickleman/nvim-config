local gwt = require('git-worktree')
-- gwt.setup()

-- local Hooks = require('git-worktree.hooks')
-- -- Basic hook to change current buffer on worktree switch
-- Hooks.register(Hooks.type.SWITCH, Hooks.builtins.update_current_buffer_on_switch)

require('telescope').load_extension('git_worktree')

local tgw = require('telescope').extensions.git_worktree

vim.keymap.set('n', '<Leader>gw', tgw.git_worktree, {})
vim.keymap.set('n', '<Leader>gW', require('telescope').extensions.git_worktree.create_git_worktree, {})
