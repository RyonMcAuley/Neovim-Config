return {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
        { "zbirenbaum/copilot.lua" }, -- Ensure Copilot is already set up and authenticated
        { "nvim-lua/plenary.nvim" },  -- Required
    },
    opts = {
        -- Optional: customize if needed
        context = {
            strategy = "default", -- Auto-detect the best strategy
            providers = {
                "current_file",
                "visible_buffers",
            },
        },
    },
    context = {
        strategy = "default", -- Auto-detect the best strategy
        providers = {
            "current_file",
            "visible_buffers",
        },
    },
    cmd = { "CopilotChat", "CopilotChatToggle" }, -- Lazy-load on command
    keys = {
        { "<leader>cc", "<cmd>CopilotChatToggle<cr>", desc = "Toggle Copilot Chat" },
        -- <C-s> is used for sending messages in Copilot Chat
    },
    -- not working
    mappings = {
        submit_prompt = {
            normal = "<CR>",  -- Enter to submit the prompt in normal mode
            insert = '<C-s>', -- Shift + Enter to submit the prompt in insert mode
        },
        show_diff = {
            full_diff = true, -- Show full diff
        }
    },
}
