local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

local plugins = {
	'tpope/vim-surround', -- Surrounding ysw)
	'jiangmiao/auto-pairs', -- Adding pairs to symbols and tags
	'preservim/nerdtree', -- NerdTree
	'tpope/vim-commentary', -- For Commenting gcc & gc
	'vim-airline/vim-airline', -- Status bar
	'ap/vim-css-color', -- CSS Color Preview
	'rafi/awesome-vim-colorschemes', -- Retro Scheme
	'neoclide/coc.nvim',  -- Auto Completion
	'ryanoasis/vim-devicons', -- Developer Icons
	'tc50cal/vim-terminal', -- Vim Terminal
	'preservim/tagbar', -- Tagbar for code navigation
	'mg979/vim-visual-multi', -- <C-Down> for multiple cursors
	'neovim/nvim-lspconfig', -- LSP config package
	'tpope/vim-fugitive', -- basic git integration
	'lewis6991/gitsigns.nvim', -- git integration
	{
		'nvim-telescope/telescope.nvim', -- Alternate file browser
		branch = '0.1.x',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
	'Glench/Vim-Jinja2-Syntax', -- Jinja 2 syntax highlighting
}

local opts = {}

require("lazy").setup(plugins, opts)
