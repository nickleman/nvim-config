if vim.loop.os_uname().sysname == "Windows_NT" then
    require('nvim-treesitter.install').compilers = { "clang" }
end
require('nvim-treesitter.configs').setup {
    -- A list of parser names, or "all"
    ensure_installed = { "c", "lua", "rust", "vim", "html", "css",
        "javascript", "python", "vimdoc", "query", "latex", "sql" },

    -- Install parsers synchronously (only applied to 'ensure_installed')
    sync_install = false,
    auto_install = true,
    highlight = {
        max_file_lines = 10000,
        enable = true,
        disable = function(lang, bufnr)
            return vim.fn.getfsize(vim.api.nvim_buf_get_name(bufnr)) > 1 * 1024 * 1024
        end,
        additional_vim_regex_highlighting = false,
    },
    indent = { enable = true, },
    disable = function(lang, bufnr)
        return vim.fn.getfsize(vim.api.nvim_buf_get_name(bufnr)) > 1 * 1024 * 1024
    end,
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<Leader>ss",
            node_incremental = "<Leader>si",
            scope_incremental = "<Leader>s>",
            node_decremental = "<Leader>sd",
        },
    },
    textobjects = {
        select = {
            enable = false,
        }
    },
}
