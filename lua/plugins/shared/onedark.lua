return {
  'navarasu/onedark.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require('onedark').setup {
      style = 'darker',
      transparent = true,
      term_colors = true
    }
  end
}
