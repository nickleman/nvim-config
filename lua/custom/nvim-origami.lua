vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99

local fold_util = require("utils.code_folds")

-- <CR> toggles folds, but only where <CR> has no other meaning. In quickfix it jumps
--  to the entry, in help it follows a tag, and in plugin list buffers it selects --
--  so anything with a non-empty 'buftype' falls through to a real <CR>. Likewise when
--  the cursor is not inside a fold, so pressing Enter in an unfolded file still moves
--  down a line instead of erroring with E490.
vim.keymap.set("n", "<CR>", function()
    if vim.bo.buftype ~= "" then return "<CR>" end
    if vim.fn.foldlevel(".") == 0 then return "<CR>" end
    return "za"
end, { expr = true, noremap = true, silent = true })
vim.keymap.set("n", "[[", fold_util.goto_previous_fold, { noremap = true, silent = true })
vim.keymap.set("n", "]]", "zj", { noremap = true, silent = true })

vim.api.nvim_create_autocmd({ "TextChanged", "InsertLeave", "LspAttach" }, {
    callback = function(opts)
        fold_util.update_ranges(opts.buf)
    end,
})

local last_row = nil
vim.api.nvim_create_autocmd("CursorMoved", {
    callback = function(opts)
        local row = vim.api.nvim_win_get_cursor(0)[1]
        if row ~= last_row then
            last_row = row

            fold_util.update_current_fold(row, opts.buf)
        end
    end,
})

vim.api.nvim_create_autocmd({ "BufUnload", "BufWipeout" }, {
    callback = function(opts)
        fold_util.clear(opts.buf)
    end,
})

-- NOTE: the quickfix FileType workaround that used to live here (deleting and
--  re-adding a buffer-local <CR>) is no longer needed -- the buftype guard on the
--  <CR> mapping above covers quickfix, help, and every other special buffer.
