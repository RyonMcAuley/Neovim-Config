local lspconfig = require("lspconfig")
local pid = vim.fn.getpid()
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- require("lsp.omnisharp")
require("lsp.go-lsp")
