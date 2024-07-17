local wk = require('which-key')
wk.setup()

-- Document existing key chains
wk.add({
    { '<leader>c',  name = '[C]ode' },
    { '<leader>c_', hidden = true },
    { '<leader>d',  name = '[D]ocument' },
    { '<leader>d_', hidden = true },
    { '<leader>r',  name = '[R]ename' },
    { '<leader>r_', hidden = true },
    { '<leader>f',  name = '[F]uzzy Find' },
    { '<leader>f_', hidden = true },
    { '<leader>w',  name = '[W]orkspace' },
    { '<leader>w_', hidden = true },
    { '<leader>h',  name = 'Gitsign Change [H]unks' },
    { '<leader>h_', hidden = true },
    { '<leader>t',  name = '[T]abs' },
    { '<leader>t_', hidden = true },
    { '<leader>s',  name = '[S]election' },
    { '<leader>s_', hidden = true },
    { '<leader>g',  name = '[G]it Worktrees' },
    { '<leader>g_', hidden = true },
})
