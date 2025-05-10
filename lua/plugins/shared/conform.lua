return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    opts = {
        format_on_save = {
            lsp_fallback = true,
            timeout_ms = 1000,
        },
        formatters_by_ft = {
            lua = { "stylua" },
            go = { "goimports", "gofmt" },
            csharp = { "dotnet_format" },
            javascript = { "prettier" },
            typescript = { "prettier" },
            html = { "prettier" },
            -- python = { "black", "isort" },
            sh = { "shfmt" },
            rust = { "rustfmt" },
        },
    },
}
