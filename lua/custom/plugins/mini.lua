return { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
        -- Better Around/Inside textobjects
        --
        -- Examples:
        --  - va)  - [V]isually select [A]round [)]paren
        --  - yinq - [Y]ank [I]nside [N]ext [']quote
        --  - ci'  - [C]hange [I]nside [']quote
        require('mini.ai').setup { n_lines = 500 }

        -- Add/delete/replace surroundings (brackets, quotes, etc.)
        --
        -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
        -- - sd'   - [S]urround [D]elete [']quotes
        -- - sr)'  - [S]urround [R]eplace [)] [']
        require('mini.surround').setup()

        -- Simple and easy statusline.
        --  You could remove this setup call if you don't like it,
        --  and try some other statusline plugin
        -- local statusline = require 'mini.statusline'
        -- set use_icons to true if you have a Nerd Font
        -- statusline.setup { use_icons = vim.g.have_nerd_font }

        -- You can configure sections in the statusline by overriding their
        -- default behavior. For example, here we set the section for
        -- cursor location to LINE:COLUMN
        ---@diagnostic disable-next-line: duplicate-set-field
        -- statusline.section_location = function()
        --   return '%2l:%-2v'
        -- end

        -- Move lines around with ALT-arrow keys. In visual mode you can select
        -- multiple lines and move them (they will auto-re-indent as they move)
        -- in insert mode the current line only will move.
        require('mini.move').setup(
            {
                mappings = {
                    -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
                    left = '<M-left>',
                    right = '<M-right>',
                    down = '<M-down>',
                    up = '<M-up>',

                    -- Move current line in Normal mode
                    line_left = '<M-left>',
                    line_right = '<M-right>',
                    line_down = '<M-down>',
                    line_up = '<M-up>',
                },
            }
        )

        -- Configurable functions for moving forward and backwards using [, and ]
        -- [B go to first buffer [b go to previous buffer
        -- ]B go to last buffer ]b go to next buffer
        -- C and c for comments
        -- X and x for conflict markers
        -- D and d for diagnostics
        -- I and i for indentation changes
        -- Q and q for quick fix entries
        -- W and w for windows in the current tab
        -- T and t for Tree-sitter node and parents
        require('mini.bracketed').setup()

        -- ... and there is more!
        --  Check out: https://github.com/echasnovski/mini.nvim
    end,
}
