-- this is what you previously passed to ensure_installed
local languages = { "c", "css", "diff", "html", "javascript",
    "jinja", "jinja_inline", "latex", "lua", "python", "query",
    "rust", "sql", "vim", "vimdoc" }

-- replicate `ensure_installed`, runs asynchronously, skips existing languages
require('nvim-treesitter').install(languages)

vim.api.nvim_create_autocmd('FileType', {
    group = vim.api.nvim_create_augroup('treesitter.setup', {}),
    callback = function(args)
        local buf = args.buf
        local filetype = args.match

        -- you need some mechanism to avoid running on buffers that do not
        -- correspond to a language (like oil.nvim buffers), this implementation
        -- checks if a parser exists for the current language
        local language = vim.treesitter.language.get_lang(filetype) or filetype
        if not vim.treesitter.language.add(language) then
            return
        end

        -- replicate `fold = { enable = true }`
        vim.opt.foldmethod = 'expr'
        vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        vim.opt.foldlevel= 99
        vim.opt.foldlevelstart = 99

        -- replicate `highlight = { enable = true }`
        vim.treesitter.start(buf, language)

        -- replicate `indent = { enable = true }`
        vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

        -- `incremental_selection = { enable = true }` covered by 0.12.0
    end,
})
-- -- if vim.loop.os_uname().sysname == "Windows_NT" then
--     require('nvim-treesitter.install').compilers = { "clang" }
-- end
-- require('nvim-treesitter.config').setup {
--     -- A list of parser names, or "all"
--     ensure_installed = { "c", "diff", "lua", "rust", "vim", "html", "css",
--         "javascript", "jinja", "jinja_inline", "python", "vimdoc", "query", "latex", "sql" },
--
--     -- Install parsers synchronously (only applied to 'ensure_installed')
--     sync_install = false,
--     auto_install = true,
--     highlight = {
--         max_file_lines = 10000,
--         enable = true,
--         disable = function(lang, bufnr)
--             return vim.fn.getfsize(vim.api.nvim_buf_get_name(bufnr)) > 1 * 1024 * 1024
--         end,
--         additional_vim_regex_highlighting = false,
--     },
--     indent = { enable = true, },
--     disable = function(lang, bufnr)
--         return vim.fn.getfsize(vim.api.nvim_buf_get_name(bufnr)) > 1 * 1024 * 1024
--     end,
--     incremental_selection = {
--         enable = true,
--         keymaps = {
--             init_selection = "<Leader>ss",
--             node_incremental = "<Leader>si",
--             scope_incremental = "<Leader>s>",
--             node_decremental = "<Leader>sd",
--         },
--     },
--     textobjects = {
--         select = {
--             enable = false,
--         }
--     },
-- }
