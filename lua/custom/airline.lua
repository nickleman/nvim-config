vim.g["airline_powerline_fonts"] = 1

-- if !exists('g:airline_symbols')
--     let g:airline_symbols = {}
-- endif

-- airline symbols
vim.g["airline_left_sep"] = ''
vim.g["airline_left_alt_sep"] = ''
vim.g["airline_right_sep"] = ''
vim.g["airline_right_alt_sep"] = ''
vim.g["airline_symbols.branch"] = ''
vim.g["airline_symbols.readonly"] = ''
vim.g["airline_symbols.linenr"] = ''
-- Enable the list of buffers
vim.g["airline#extensions#tabline#enabled"] = 1
-- Show just the filename
vim.g["airline#extensions#tabline#fnamemod"] = ':t'
