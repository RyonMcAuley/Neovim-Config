---@diagnostic disable: undefined-global

-- return {
--     {
--         "williamboman/mason.nvim",
--         build = ":MasonUpdate",
--         config = function()
--             require("mason").setup()
--         end,
--     },
--     {
--         "williamboman/mason-lspconfig.nvim",
--         dependencies = {
--             "williamboman/mason.nvim",
--             "neovim/nvim-lspconfig",
--             -- Optional: only if you're using extended omnisharp support
--             -- "Hoffs/omnisharp-extended-lua",
--         },
--         config = function()
--             require("lspconfig")
--             require("mason-lspconfig").setup({
--                 ensure_installed = { "gopls", "omnisharp", "ts_ls", "lua_ls", "rust_analyzer" },
--                 automatic_installation = true,
--             })
--
--             -- local lspconfig = require("lspconfig")
--             local lspconfig = vim.lsp.config
--
--             local on_attach = function(_, bufnr)
--                 local map = function(mode, lhs, rhs, desc)
--                     vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
--                 end
--
--                 --map("n", "gd", vim.lsp.buf.definition, "Go to Definition")
--                 map("n", "K", vim.lsp.buf.hover, "Hover Docs")
--                 map("n", "<leader>rn", vim.lsp.buf.rename, "Rename Symbol")
--                 map("n", "<leader>ca", vim.lsp.buf.code_action, "Code Action")
--             end
--
--             -- Go
--             lspconfig.gopls.setup({
--                 on_attach = on_attach,
--             })
--
--             -- C#
--             lspconfig.omnisharp.setup({
--                 on_attach = on_attach,
--                 -- handlers = {
--                 --   ["textDocument/definition"] = require('omnisharp_extended').handler,
--                 -- },
--                 enable_roslyn_analyzers = true,
--                 organize_imports_on_format = true,
--             })
--
--             -- JavaScript
--             lspconfig.ts_ls.setup({
--                 on_attach = on_attach,
--             })
--
--             -- Rust
--             lspconfig.rust_analyzer.setup({
--                 on_attach = on_attach,
--                 -- settings = {
--                 --     ["rust-analyzer"] = {
--                 --         checkOnSave = { true
--                 --     },
--                 -- },
--             })
--
--             -- Lua (especially useful for Neovim configs)
--             lspconfig.lua_ls.setup({
--                 on_attach = on_attach,
--                 settings = {
--                     Lua = {
--                         runtime = {
--                             version = "LuaJIT",
--                         },
--                         diagnostics = {
--                             globals = { "vim" },
--                         },
--                         workspace = {
--                             library = vim.api.nvim_get_runtime_file("", true),
--                             checkThirdParty = false,
--                         },
--                         telemetry = {
--                             enable = false,
--                         },
--                     },
--                 },
--             })
--             -- vim.lsp.config.lua_ls.setup({
--             --     on_attach = on_attach,
--             --     settings = {
--             --         Lua = {
--             --             runtime = {
--             --                 version = "LuaJIT",
--             --             },
--             --             diagnostics = {
--             --                 globals = { "vim" },
--             --             },
--             --             workspace = {
--             --                 library = vim.api.nvim_get_runtime_file("", true),
--             --                 checkThirdParty = false,
--             --             },
--             --             telemetry = {
--             --                 enable = false,
--             --             },
--             --         },
--             --     },
--             -- })
--         end,
--     },
-- }

return {
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "neovim/nvim-lspconfig",
            -- Optional: only if you're using extended omnisharp support
            -- "Hoffs/omnisharp-extended-lua",
        },
        config = function()
            -- Force-load all LSP server definitions
            require("lspconfig") -- <-- THIS IS THE FIX

            require("mason-lspconfig").setup({
                ensure_installed = {
                    "gopls",
                    "omnisharp",
                    "ts_ls",
                    "lua_ls",
                    "rust_analyzer",
                },
            })
            handlers = {
                -- Default handler (for all servers)
                function(server)
                    vim.lsp.config[server].setup({
                        on_attach = function(_, bufnr)
                            local map = function(mode, lhs, rhs, desc)
                                vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
                            end
                            map("n", "K", vim.lsp.buf.hover, "Hover Docs")
                            map("n", "<leader>rn", vim.lsp.buf.rename, "Rename Symbol")
                            map("n", "<leader>ca", vim.lsp.buf.code_action, "Code Action")
                        end,
                    })
                end,

                -- Server-specific overrides:
                gopls = function()
                    vim.lsp.config.gopls.setup({
                        on_attach = on_attach,
                        settings = {
                            gopls = {
                                completeUnimported = true,
                                usePlaceholders = true,
                                staticcheck = true,
                            },
                        },
                    })
                end,

                lua_ls = function()
                    vim.lsp.config.lua_ls.setup({
                        on_attach = on_attach,
                        settings = {
                            Lua = {
                                runtime = {
                                    version = "LuaJIT",
                                },
                                diagnostics = {
                                    globals = { "vim" },
                                },
                                workspace = {
                                    library = vim.api.nvim_get_runtime_file("", true),
                                    checkThirdParty = false,
                                },
                                telemetry = {
                                    enable = false,
                                },
                            },
                        },
                    })
                end,
            }
        end,
    },
}
