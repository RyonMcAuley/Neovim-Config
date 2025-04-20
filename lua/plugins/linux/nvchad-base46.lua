return {
  "nvchad/base46",
  lazy = false,
  priority = 1000,
  config = function()
    local base46 = require('base46')
    local scheme = 'tokyonight-trans'

    if base46.base46 == nil then
      base46.base46 = {
        theme = vim.g.nvchad_theme or scheme,
      }
    end
    require('nvconfig').base46.theme = scheme
    require('base46').load_all_highlights()
    -- require('base46').toggle_transparency()
  end,
}
