-- local lspconfig = require("lspconfig")
-- local pid = vim.fn.getpid()
-- local capabilities = require("cmp_nvim_lsp").default_capabilities()
--
-- -- require("lsp.omnisharp")
-- require("lsp.go-lsp")
--
return function(capabilities)
  local lspconfig = require("lspconfig")
  lspconfig.lua_ls.setup({ capabilities = capabilities })
end
