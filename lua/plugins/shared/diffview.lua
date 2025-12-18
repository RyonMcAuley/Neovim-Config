-- lazy.nvim plugin config
return {
  "sindrets/diffview.nvim",
  dependencies = "nvim-lua/plenary.nvim",
  config = true,
    keys = {
    { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Open Git Diff View" },
    { "<leader>gh", "<cmd>DiffviewFileHistory<cr>", desc = "Git File History" },
    { "<leader>gq", "<cmd>DiffviewClose<cr>", desc = "Close Git Diff View" },
  }

}

