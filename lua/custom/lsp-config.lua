--  This function gets run when an LSP attaches to a particular buffer.
--    That is to say, every time a new file is opened that is associated with
--    an lsp (for example, opening `main.rs` is associated with `rust_analyzer`) this
--    function will be executed to configure the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
    callback = function(event)
        -- NOTE: Remember that Lua is a real programming language, and as such it is possible
        -- to define small helper and utility functions so you don't have to repeat yourself.
        --
        -- In this case, we create a function that lets us more easily define mappings specific
        -- for LSP related items. It sets the mode, buffer and description for us each time.
        local map = function(keys, func, desc)
            vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end

        -- Rename the variableunder your cursor.
        --  Most Langauge Servers support renaming across files, etc.
        map('<Leader>rn', vim.lsp.buf.rename, '[r]e[n]ame')

        -- Execute a code action, usually your cursor needs to be on
        -- top of an error or a suggestion from your LSP for this to
        -- activate.
        map('<Leader>ca', vim.lsp.buf.code_action, '[c]ode [a]ction')

        -- Use the LSP to format the code in the current buffer
        map('<Leader>cf', vim.lsp.buf.format, '[c]ode [f]ormat')

        -- Jump to the definition of the word under your cursor.
        --  This is where a variable was first declared, or where a function is defined, etc.
        --  To jump back, press <C-o>. (<C-t>, the tag-stack pop, is mapped to
        --  Neotree toggle in custom/neo-tree.lua.)
        map('gd', vim.lsp.buf.definition, '[g]oto [d]efinition')

        -- Jump to the implementation of the word under your cursor.
        map('gi', vim.lsp.buf.implementation, '[g]oto [i]mplementation')

        -- Jump to the implementation of the word under your cursor.
        --  Useful when your language has ways of declaring types without an actual implementation.
        map('gI', require('telescope.builtin').lsp_implementations, '[g]oto [I]mplementation')

        -- Find references for the word under your cursor
        map('gr', require('telescope.builtin').lsp_references, '[g]oto [r]eferences')

        -- Fuzzy find all the symbols in your current document.
        --  Symbols are things like variables, functions, types,
        --  etc.
        map('<Leader>ds', require('telescope.builtin').lsp_document_symbols, '[d]ocument [s]ymbols')

        -- Fuzzy find all the symbols in your current workspace.
        --  Similar to document symbols, except searches over your
        --  entire project.
        map('<Leader>ws', require('telescope.builtin').lsp_workspace_symbols, '[w]orkspace [s]ymbols')

        -- Opens a popup that displays documentation about the word under your cursor
        --  See `:help K` for why this keymap.
        map('<Leader>K', vim.lsp.buf.hover, 'Hover Documentation')

        -- Create a command :Format to format the current buffer
        vim.api.nvim_create_user_command("Format", function()
            vim.lsp.buf.format()
        end, {})

        -- The following two autocommands are used to highlight references of the
        -- word under your cursor when your cursor rests there for a little while.
        --    See `:help CursorHold` for information about when this is executed
        --
        -- When you move your cursor, the highlights will be cleared (the second autocommand).
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client.server_capabilities.documentHighlightProvider then
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
                buffer = event.buf,
                callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
                buffer = event.buf,
                callback = vim.lsp.buf.clear_references,
            })
        end
    end,
})

-- Per-server configuration lives in `after/lsp/<server>.lua`. Neovim collects every
--  `lsp/<name>.lua` on the runtimepath and merges them in rtp order, so those files
--  layer cleanly on top of the defaults nvim-lspconfig ships. See `:help vim.lsp.config`.
--
--  Available keys are:
--  - cmd (table): Override the default command used to start the server
--  - filetypes (table): Override the default list of associated filetypes for the server
--  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
--  - settings (table): Override the default settings passed when initializing the server.
--        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/

-- Diagnostic display. `virtual_lines` is the built-in replacement for lsp_lines.nvim
--  (Neovim 0.11+). virtual_text is turned off because leaving both on renders every
--  diagnostic twice -- which is what the old lsp_lines setup was doing.
--  If the always-on multiline output is too noisy, `virtual_lines = { current_line =
--  true }` limits it to the line the cursor is on.
vim.diagnostic.config({
    virtual_lines = true,
    virtual_text = false,
    underline = true,
    severity_sort = true,
})

-- LSP servers and clients are able to communicate to each other what features they support.
--  By default, Neovim doesn't support everything that is in the LSP specification.
--  When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
--  The '*' config applies to every server, so this is broadcast once here rather
--  than repeated per server.
vim.lsp.config('*', {
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
})

-- NOTE: `mason.setup()` is driven by `opts` in custom/plugins/lsp-config.lua. It is a
--  dependency of nvim-lspconfig, so lazy configures it before this file runs.
--
--  To check the current status of installed tools and/or manually install
--  other tools, you can run
--    :Mason
--
--  You can press `g?` for help in this menu.

-- Language servers. These are lspconfig names, matching the `after/lsp/*.lua`
--  filenames. `automatic_enable` runs `vim.lsp.enable()` for everything Mason has
--  installed, so there is no separate enable list to keep in sync.
require('mason-lspconfig').setup {
    ensure_installed = {
        'clangd',
        'dockerls', 'docker_compose_language_service',
        'emmet_language_server',
        'html', 'htmx',
        'jinja_lsp', 'jsonls',
        'lua_ls',
        'marksman',
        'ruff',
        'tailwindcss', 'ty',
    },
    automatic_enable = {
        -- stylua is installed as a formatter, but nvim-lspconfig also ships an
        -- `lsp/stylua.lua` (`stylua --lsp`). Enabling it would put a second
        -- formatting-capable client on every Lua buffer, so `vim.lsp.buf.format()`
        -- would prompt for which client to use.
        exclude = { 'stylua' },
    },
}

-- Everything that isn't a language server: formatters, linters, debug adapters.
--  NOTE: these are Mason *package* names, not lspconfig server names.
require('mason-tool-installer').setup {
    ensure_installed = {
        'debugpy', -- Python debug adapter, used by nvim-dap-python
        'stylua',  -- Used to format Lua code
    },
}

-- Not a Mason package (self-managed in ~/.local/bin), so enable it by hand.
vim.lsp.enable('pytest_lsp')
