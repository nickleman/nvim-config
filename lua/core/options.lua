-- Set highlight on search
vim.o.hlsearch = true

-- Make line numbers the default
vim.o.number = true
vim.o.relativenumber = true

-- Set up basic indenting and tab sizes
vim.o.autoindent = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.smarttab = true
vim.o.softtabstop = 4

-- Enable the mouse interactions
vim.o.mouse = 'a'

-- Enable auto completion menu after pressing TAB.
vim.o.wildmenu = true

-- Make wildmenu behave like similar to Bash completion.
vim.o.wildmode = "list:longest"

-- There are certain files that we would never want to edit with Vim.
-- Wildmenu will ignore files with these extensions.
vim.o.wildignore = '*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx'

-- Highlight cursor line underneath the cursor horizontally.
vim.o.cursorline = true

-- Highlight cursor line underneath the cursor vertically.
vim.o.cursorcolumn = true

-- Set colorscheme
vim.cmd.termguicolors = true
-- vim.cmd [[colorscheme onedark]]
vim.cmd.colorscheme "jellybeans"
-- Change the SignColumn color though
vim.api.nvim_set_hl(0, 'SignColumn', { link = 'LineNr' })

-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Clear search highlights on ' h'
vim.keymap.set('n', '<Leader>h', ':nohlsearch<CR>')

