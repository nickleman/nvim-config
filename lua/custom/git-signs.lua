require('gitsigns').setup {
    -- signs = {
    -- add          = { text = '+' },
    -- change       = { text = '~' },
    -- delete       = { text = '_' },
    -- topdelete    = { text = '‾' },
    -- changedelete = { text = '~' },
    -- untracked    = { text = '┆' },
    -- },
    signcolumn                   = true, -- Toggle with `:Gitsigns toggle_signs`
    numhl                        = false, -- Toggle with `:Gitsigns toggle_numhl`
    linehl                       = false, -- Toggle with `:Gitsigns toggle_linehl`
    word_diff                    = false, -- Toggle with `:Gitsigns toggle_word_diff`
    watch_gitdir                 = {
        follow_files = true
    },
    auto_attach                  = true,
    attach_to_untracked          = true,
    current_line_blame           = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
    current_line_blame_opts      = {
        virt_text = true,
        virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
        delay = 1000,
        ignore_whitespace = false,
        virt_text_priority = 100,
    },
    current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
    sign_priority                = 6,
    update_debounce              = 100,
    status_formatter             = nil,  -- Use default
    max_file_length              = 40000, -- Disable if file is longer than this (in lines)
    preview_config               = {
        -- Options passed to nvim_open_win
        border = 'single',
        style = 'minimal',
        relative = 'cursor',
        row = 0,
        col = 1
    },
    -- yadm                         = {
    --     enable = false
    -- },
    on_attach                    = function(bufnr)
        local gs = require('gitsigns')

        local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        --  next_hunk/prev_hunk are deprecated in favor of nav_hunk().
        map('n', ']h', function()
            if vim.wo.diff then return ']c' end
            vim.schedule(function() gs.nav_hunk('next') end)
            return '<Ignore>'
        end, { expr = true })

        map('n', '[h', function()
            if vim.wo.diff then return '[c' end
            vim.schedule(function() gs.nav_hunk('prev') end)
            return '<Ignore>'
        end, { expr = true })

        -- Actions
        map('n', '<leader>hs', gs.stage_hunk)
        map('n', '<leader>hr', gs.reset_hunk)
        map('v', '<leader>hs', function() gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
        map('v', '<leader>hr', function() gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
        map('n', '<leader>hS', gs.stage_buffer)
        -- undo_stage_hunk is deprecated: stage_hunk now toggles, so calling it on a
        --  staged hunk unstages it. Note this is position-based rather than a pop of
        --  the last stage operation, which is what undo_stage_hunk did.
        map('n', '<leader>hu', gs.stage_hunk)
        map('n', '<leader>hR', gs.reset_buffer)
        map('n', '<leader>hp', gs.preview_hunk)
        map('n', '<leader>hb', function() gs.blame_line { full = true } end)
        map('n', '<leader>tb', gs.toggle_current_line_blame)
        map('n', '<leader>hd', gs.diffthis)
        map('n', '<leader>hD', function() gs.diffthis('~') end)
        map('n', '<leader>td', gs.toggle_deleted)

        -- Text object
        map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
    end
}

-- Always show the sign column. Global, so it does not belong in on_attach (which runs
--  once per attached buffer).
vim.opt.signcolumn = "yes"

-- Fix diff line color. Also hoisted out of on_attach, and re-applied on ColorScheme
--  because loading a colorscheme clears every highlight group.
local function gitsigns_hl()
    vim.api.nvim_set_hl(0, 'GitSignsChange', { link = 'Function' })
end
vim.api.nvim_create_autocmd('ColorScheme', {
    desc = 'Keep GitSignsChange linked to Function across colorscheme changes',
    group = vim.api.nvim_create_augroup('gitsigns-hl', { clear = true }),
    callback = gitsigns_hl,
})
gitsigns_hl()
