return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      -- Optional config
      size = 20,
      open_mapping = [[<c-\>]],
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 2,
      direction = "horizontal", -- this gets overridden by floating terminals
      float_opts = {
        border = "curved",
        winblend = 3,
      },
    })
  end
}
