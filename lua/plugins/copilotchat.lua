return {
  "CopilotC-Nvim/CopilotChat.nvim",
  dependencies = {
    { "zbirenbaum/copilot.lua" }, -- Ensure Copilot is already set up and authenticated
    { "nvim-lua/plenary.nvim" },  -- Required
  },
  opts = {
    -- Optional: customize if needed
  },
  cmd = { "CopilotChat", "CopilotChatToggle" }, -- Lazy-load on command
  keys = {
    { "<leader>cc", "<cmd>CopilotChatToggle<cr>", desc = "Toggle Copilot Chat" },
  },
}

