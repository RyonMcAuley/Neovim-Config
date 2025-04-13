local lspconfig = require("lspconfig")

lspconfig.gopls.setup({
  on_attach = function(client, bufnr)
    -- add any buffer-local keymaps or cmp settings here
    -- for example:
    require('cmp').setup.buffer({
      sources = {
        { name = 'nvim_lsp' },
      }
    })
  end,
  settings = {
    gopls = {
      usePlaceholders = true,
      completeUnimported = true,
      staticcheck = true,
    },
  },
})

