-- cmp.lua - Lazy plugin setup for nvim-cmp and related plugins
return {
  -- nvim-cmp for auto-completion
  { 'hrsh7th/nvim-cmp' },

  -- LSP config
  { 'neovim/nvim-lspconfig' },

  -- nvim-cmp source for LSP
  { 'hrsh7th/cmp-nvim-lsp' },

  -- Optionally, for buffer and path completions:
  { 'hrsh7th/cmp-buffer' },
  { 'hrsh7th/cmp-path' },

  -- Optional snippet completion (useful for LSP)
  { 'saadparwaiz1/cmp_luasnip' }
}

