vim.g["airline_powerline_fonts"] = 1

-- if !exists('g:airline_symbols')
--     let g:airline_symbols = {}
-- endif

-- airline symbols
vim.g["airline_left_sep"] = ''
vim.g["airline_left_alt_sep"] = ''
vim.g["airline_right_sep"] = ''
vim.g["airline_right_alt_sep"] = ''
-- These are members of the g:airline_symbols dict, so they cannot be set as
--  `vim.g['airline_symbols.branch']` -- that just creates a global whose name
--  happens to contain a dot. Airline fills in its own defaults with extend(...,
--  'keep'), so read-modify-write to keep the keys it sets (space, colnr, ...).
vim.g.airline_symbols = vim.tbl_extend('force', vim.g.airline_symbols or {}, {
    branch = '',
    readonly = '',
    linenr = '',
})
-- Enable the list of buffers
vim.g["airline#extensions#tabline#enabled"] = 1
-- Show just the filename
vim.g["airline#extensions#tabline#fnamemod"] = ':t'
