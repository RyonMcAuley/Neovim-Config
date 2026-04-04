return {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
        { "zbirenbaum/copilot.lua" }, -- Ensure Copilot is already set up and authenticated
        { "nvim-lua/plenary.nvim" },  -- Required
    },
    opts = {
        -- Optional: customize if needed
        model = "claude-sonnet-4.6",
        context = {
            strategy = "default", -- Auto-detect the best strategy
            providers = {
                "current_file",
                "visible_buffers",
            },
        },
        window = {
            width = .3,
        },
        auto_insert_mode = "true",
        mappings = {
            submit_prompt = {
                normal = "<CR>",  -- Enter to submit the prompt in normal mode
                insert = '<C-s>', -- Shift + Enter to submit the prompt in insert mode
            },
            show_diff = {
                full_diff = true, -- Show full diff
            },
            reset = {
                normal = false,
                insert = false,
            },
        },
        on_open = function(source)
            vim.keymap.set({ "n", "i" }, "<C-l>", function()
                vim.cmd("wincmd l")
            end, { buffer = true, silent = true })
        end,
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
    },
    -- not working
}
