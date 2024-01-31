-- Window splitting aliases
vim.api.nvim_set_keymap("n", "<Leader>hs", "<C-w>s", {noremap=true})
vim.api.nvim_set_keymap("n", "<Leader>vs", "<C-w>v", {noremap=true})

-- Navigation between windows
vim.api.nvim_set_keymap("n", "<A-h>", "<C-w>h", {noremap=true})
vim.api.nvim_set_keymap("n", "<A-j>", "<C-w>j", {noremap=true})
vim.api.nvim_set_keymap("n", "<A-k>", "<C-w>k", {noremap=true})
vim.api.nvim_set_keymap("n", "<A-l>", "<C-w>l", {noremap=true})

-- Resizing windows
vim.api.nvim_set_keymap("n", "<A-S-h>", "<C-w><", {noremap=true})
vim.api.nvim_set_keymap("n", "<A-S-l>", "<C-w>>", {noremap=true})
vim.api.nvim_set_keymap("n", "<A-S-j>", "<C-w>-", {noremap=true})
vim.api.nvim_set_keymap("n", "<A-S-k>", "<C-w>+", {noremap=true})

-- Resizing windows
vim.api.nvim_set_keymap("n", "<A-C-h>", "<C-w>H", {noremap=true})
vim.api.nvim_set_keymap("n", "<A-C-l>", "<C-w>L", {noremap=true})
vim.api.nvim_set_keymap("n", "<A-C-j>", "<C-w>J", {noremap=true})
vim.api.nvim_set_keymap("n", "<A-C-k>", "<C-w>K", {noremap=true})

-- Close Window
vim.api.nvim_set_keymap("n", "<Leader>wc", ":q<Cr>", {noremap=true})

-- Creating and navigating tabs 
vim.api.nvim_set_keymap("n", "<Leader>tc", ":tabnew<Cr>", {noremap=true})
vim.api.nvim_set_keymap("n", "<Leader>tq", ":tabclose<Cr>", {noremap=true})
vim.api.nvim_set_keymap("n", "<Leader>tn", ":tabnext<Cr>", {noremap=true})
vim.api.nvim_set_keymap("n", "<Leader>tp", ":tabprevious<Cr>", {noremap=true})
