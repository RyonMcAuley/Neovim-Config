return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons", -- optional but recommended for icons
  },
  config = function()
    require("nvim-tree").setup({
      view = {
        width = 35,
        side = "left",
      },
      renderer = {
        group_empty = true,
      },
      update_focused_file = {
        enable = true,
      },
      filters = {
        dotfiles = true,
      },
    })
  end,
  keys = {
    { "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Toggle File Explorer" },
    { "<leader>f", "<cmd>NvimTreeFindFile<CR>", desc = "Reveal Current File in Explorer" },
  },
}

