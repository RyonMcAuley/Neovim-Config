return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "Hoffs/omnisharp-extended-lsp.nvim",
  },
  config = function()
    -- Example: configure lua language server
    require("lspconfig").lua_ls.setup({})
  end
}

