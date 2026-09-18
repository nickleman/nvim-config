return {
    {
        "selimacerbas/markdown-preview.nvim",
        lazy = true,
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        dependencies = {
            "selimacerbas/live-server.nvim"
        },
        config = function()
            require("markdown_preview").setup({
                -- All optional config settings (sane defaults shown):
                instance_mode = "takeover", -- "takeover" (one tab) or "multi" (tab per instance)
                port = 0,           -- 0 = auto-assign
                open_browser = true,
                default_theme = "light", -- "dark" or "light"
                debounce_ms = 300,
            })
        end
    },
    {
        'jakewvincent/mkdnflow.nvim',
        config = function()
            require('mkdnflow').setup({
                -- Config goes here; leave blank for defaults
            })
        end
    },
}

