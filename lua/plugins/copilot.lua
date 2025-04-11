return {
  -- GitHub Copilot core plugin
  {
    "github/copilot.vim",
    lazy = false, -- load on startup (or true if you want to defer)
  },
  -- GitHub Copilot for Neovim
  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    vim.api.nvim_set_keymap("n", "<leader>gc", "<cmd>Copilot panel<CR>", { noremap = true, silent = true, desc = "Open Copilot panel" }),
    config = function()
      require("copilot").setup({
        suggestion = { enabled = true, auto_trigger = false },
        panel = { enabled = false, auto_refresh = true },
      })
    end,
  },
}

