-- -- cmp.lua - Lazy plugin setup for nvim-cmp and related plugins
-- return {
--   -- nvim-cmp for auto-completion
--   { 'hrsh7th/nvim-cmp' },
--
--   -- LSP config
--   { 'neovim/nvim-lspconfig' },
--
--   -- nvim-cmp source for LSP
--   { 'hrsh7th/cmp-nvim-lsp' },
--
--   -- Optionally, for buffer and path completions:
--   { 'hrsh7th/cmp-buffer' },
--   { 'hrsh7th/cmp-path' },
--
--   -- Optional snippet completion (useful for LSP)
--   { 'saadparwaiz1/cmp_luasnip' }
-- }
--
-- cmp.lua
return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "saadparwaiz1/cmp_luasnip",
    "L3MON4D3/LuaSnip",
  },

  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    -- vim.keymap.set('i', '<C-j>', function()
    --   if cmp.visible() then
    --     cmp.select_next_item()
    --   else
    --     vim.cmd("normal! j")
    --   end
    -- end)
    --
    -- vim.keymap.set('i', '<C-k>', function()
    --   if cmp.visible() then
    --     cmp.select_prev_item()
    --   else
    --     vim.cmd("normal! k")
    --   end
    -- end)

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        -- ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-Space>"] = cmp.mapping.confirm({ select = true }),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-k>"] = cmp.mapping.select_prev_item(),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
      }),
    })
  end,
}
