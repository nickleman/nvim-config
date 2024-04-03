return  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    config = function() -- This is the function that runs, AFTER loading
      require('which-key').setup()

      -- Document existing key chains
      require('which-key').register {
        ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
        ['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
        ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
        ['<leader>f'] = { name = '[F]uzzy Find', _ = 'which_key_ignore' },
        ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
        ['<leader>h'] = { name = 'Gitsign Change [H]unks', _ = 'which_key_ignore' },
        ['<leader>t'] = { name = '[T]abs', _ = 'which_key_ignore' },
        ['<leader>s'] = { name = '[S]election', _ = 'which_key_ignore' },
        ['<leader>g'] = { name = '[G]it Worktrees', _ = 'which_key_ignore' },
      }
    end,
  }
