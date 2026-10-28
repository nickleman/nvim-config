-- 1. Stops Neovim from treating sub-lists as blank comments
vim.opt_local.comments = "b:-" -- Reset comment behavior to ONLY care about loose bullets, not nested formats

-- 2. CLEAR ALL INDENT EXPRESSIONS (Bypasses hidden indent plug-ins entirely)
vim.opt_local.indentexpr = ""

-- 3. Hard wrap settings (For when lines physically break or are manually
-- wrapped with gwip)

-- Enable list formatting, recognize numbered/bulleted lists
vim.opt_local.formatoptions:append("n") -- Recognize numbered/bulleted lists
vim.opt_local.formatoptions:append("q") -- Allow formatting of comments/lists
vim.opt_local.formatoptions:append("r") -- Automatically insert the current comment/list leader
vim.opt_local.formatoptions:append("j") -- Delete comment leader when joining lines

-- Define exactly what counts as a bullet list so Neovim knows where the text starts.
vim.opt_local.formatlistpat = [[^\s*[-*+]\s\+]]

-- 4. SOFT WRAP SETTINGS (For visual alignment while you edit existing lines)
vim.opt_local.wrap = true
vim.opt_local.linebreak = true
vim.opt_local.breakindent = true
vim.opt_local.breakindentopt = "shift:0,min:20"

-- Add some keymaps for Markdown-specific functionality
vim.keymap.set("n", "<leader>mps", "<cmd>MdKite start<cr>", { desc = "Markdown: Start preview" })
vim.keymap.set("n", "<leader>mpS", "<cmd>MdKite stop<cr>", { desc = "Markdown: Stop preview" })
vim.keymap.set("n", "<leader>mpr", "<cmd>MdKite refresh<cr>", { desc = "Markdown: Refresh preview" })
