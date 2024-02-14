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

-- Resizing windows
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
