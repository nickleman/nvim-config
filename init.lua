-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Define the jinja filetype
--  Treating every .html file as a template is deliberate. The treesitter side of
--  this lives in lua/custom/treesitter.lua (which registers 'html.jinja' -> the
--  jinja parser) and after/queries/jinja/injections.scm (which injects html into
--  the text between jinja blocks).
vim.filetype.add({
    extension = {
        -- map extension '.jinja' to filetype html.jinja
        jinja = "html.jinja",
        html = "html.jinja"
    }
})

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
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

-- Options and keymaps live in plugin/options.lua and plugin/keymaps.lua, which
--  Neovim sources automatically after this file.
require("lazy").setup({ import = "custom/plugins" }, {
    change_detection = {
        notify = false,
    },
})
