-- return {
--   "neovim/nvim-lspconfig",
--   dependencies = {
--     "Hoffs/omnisharp-extended-lsp.nvim",
--   },
--   config = function()
--     -- Example: configure lua language server
--     require("lspconfig").lua_ls.setup({})
--     local cmp_nvim_lsp = require("cmp_nvim_lsp")
--     local capabilities = cmp_nvim_lsp.default_capabilities()
--     require("lsp.servers")(capabilities)
--   end
-- }
--

return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "Hoffs/omnisharp-extended-lsp.nvim",
    },
}
