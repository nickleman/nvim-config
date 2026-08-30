local wk = require('which-key')
wk.setup()

-- Document existing key chains.
--  NOTE: the key is `group`, not `name` -- `name` is a which-key v2 idiom that v3
--  still auto-transforms but reports as deprecated. The old `{ '<leader>x_',
--  hidden = true }` entries were also v2-only placeholders and have been dropped.
wk.add({
    { '<leader>c', group = '[C]ode' },
    { '<leader>d', group = '[D]ocument' },
    { '<leader>r', group = '[R]ename' },
    { '<leader>f', group = '[F]uzzy Find' },
    { '<leader>w', group = '[W]orkspace' },
    { '<leader>h', group = 'Gitsign Change [H]unks' },
    { '<leader>t', group = '[T]abs' },
    { '<leader>s', group = '[S]election' },
    { '<leader>g', group = '[G]it Worktrees' },
})
