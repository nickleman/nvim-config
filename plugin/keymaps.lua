-- Window splitting aliases
vim.api.nvim_set_keymap("n", "<Leader>sh", "<C-w>s", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>sv", "<C-w>v", { noremap = true })

-- Navigation between windows
vim.api.nvim_set_keymap("n", "<Leader>wh", "<C-w>h", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>wj", "<C-w>j", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>wk", "<C-w>k", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>wl", "<C-w>l", { noremap = true })

-- Resizing windows
vim.api.nvim_set_keymap("n", "<A-h>", "<C-w><", { noremap = true })
vim.api.nvim_set_keymap("n", "<A-l>", "<C-w>>", { noremap = true })
vim.api.nvim_set_keymap("n", "<A-j>", "<C-w>-", { noremap = true })
vim.api.nvim_set_keymap("n", "<A-k>", "<C-w>+", { noremap = true })

-- Move windows
vim.api.nvim_set_keymap("n", "<A-C-h>", "<C-w>H", { noremap = true })
vim.api.nvim_set_keymap("n", "<A-C-l>", "<C-w>L", { noremap = true })
vim.api.nvim_set_keymap("n", "<A-C-j>", "<C-w>J", { noremap = true })
vim.api.nvim_set_keymap("n", "<A-C-k>", "<C-w>K", { noremap = true })

-- Close Window
vim.api.nvim_set_keymap("n", "<Leader>wc", ":q<Cr>", { noremap = true })

-- Creating and navigating tabs
vim.api.nvim_set_keymap("n", "<Leader>tc", ":tabnew<Cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>tq", ":tabclose<Cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>tn", ":tabnext<Cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>tp", ":tabprevious<Cr>", { noremap = true })

-- Control-Backspace to start of word
vim.api.nvim_set_keymap('i', '<C-H>', '<C-w>', { noremap = true })
-- For neovim-qt on windows
vim.api.nvim_set_keymap('i', '<C-Bs>', '<C-w>', { noremap = true })
-- Control-Delete to end of word
vim.api.nvim_set_keymap('i', '<C-Del>', '<Esc>lce', { noremap = true })

-- Clear search highlights on ' sc'
vim.keymap.set('n', '<Leader>sc', '<cmd>nohlsearch<CR>')

-- NOTE: <Esc> is deliberately NOT mapped in normal mode. Terminals send Alt-<key>
--  as <Esc><key>, so mapping <Esc> makes it ambiguous with the <A-hjkl> window
--  resize maps below and mini.move's <M-arrow> maps -- costing a 'timeoutlen' stall
--  or misfiring outright. <Leader>sc above already clears the highlight.

-- Diagnostic keymaps
--  goto_prev/goto_next are deprecated and slated for removal in 0.13. They defaulted
--  to float = true, which is passed explicitly here to keep the same behavior.
vim.keymap.set('n', '[d', function() vim.diagnostic.jump { count = -1, float = true } end,
    { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', function() vim.diagnostic.jump { count = 1, float = true } end,
    { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

