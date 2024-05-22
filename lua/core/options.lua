--  Set the default GUI font to my preference:
-- if vim.fn.has("gui_running") then
-- vim.opt.guifont = "FiraCode NF:h12:cANSI:qDRAFT"
-- -- vim.opt.lines=35
-- -- vim.opt.columns=110
-- end

-- Set to true if you have a Nerd Font installed
vim.g.have_nerd_font = true

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
vim.o.expandtab = true
vim.o.textwidth = 80

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
-- vim.cmd.colorscheme "jellybeans"
-- Change the SignColumn color though
vim.api.nvim_set_hl(0, 'SignColumn', { link = 'LineNr' })

-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Have vim wrap on words not characters
vim.wo.wrap = true
vim.wo.linebreak = true

-- Minimal number of screen lines to keep above and below the cursor
vim.opt.scrolloff = 10

-- Preview substitutions live, as you type
vim.opt.inccommand = 'split'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Set up spelling
--  You can use z= to see all the spelling options and zg to add word to the
--  good spelling list. :spellr will correct all the occurrences of the
--  misspelled word.
--  ]s and [s move to next and previous misspelled words.
vim.opt.spelllang = 'en_us'
vim.opt.spell = true

