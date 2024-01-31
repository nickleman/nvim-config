local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug 'http://github.com/tpope/vim-surround' -- Surrounding ysw)
Plug 'https://github.com/preservim/nerdtree' -- NerdTree
Plug 'https://github.com/tpope/vim-commentary' -- For Commenting gcc & gc
Plug 'https://github.com/vim-airline/vim-airline' -- Status bar
Plug 'https://github.com/ap/vim-css-color' -- CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes' -- Retro Scheme
Plug 'https://github.com/neoclide/coc.nvim'  -- Auto Completion
Plug 'https://github.com/ryanoasis/vim-devicons' -- Developer Icons
Plug 'https://github.com/tc50cal/vim-terminal' -- Vim Terminal
Plug 'https://github.com/preservim/tagbar' -- Tagbar for code navigation
Plug 'https://github.com/mg979/vim-visual-multi' -- <C-Down> for multiple cursors
Plug 'https://github.com/neovim/nvim-lspconfig' -- LSP config package
Plug 'https://github.com/tpope/vim-fugitive' -- basic git integration
Plug 'https://github.com/lewis6991/gitsigns.nvim' -- git integration
Plug 'https://github.com/nvim-lua/plenary.nvim' -- Required for telescope
Plug 'https://github.com/nvim-telescope/telescope.nvim' -- Alternate file browser
Plug 'https://github.com/Glench/Vim-Jinja2-Syntax' -- Jinja 2 syntax highlighting

vim.call('plug#end')
