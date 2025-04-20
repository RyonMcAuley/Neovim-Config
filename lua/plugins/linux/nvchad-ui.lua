return {
  "nvchad/ui",
  lazy = false,
  priority = 1000,
  dependences = { "nvim-tree/nvim-web-devicons", },
  config = function()
    require "nvchad"
  end
}
