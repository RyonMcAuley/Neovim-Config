return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "nvim-neotest/nvim-nio", -- List this as a top-level dependency
        {
            "rcarriga/nvim-dap-ui",
            dependencies = {
                "nvim-neotest/nvim-nio", -- Keep it here too to ensure proper ordering
            },
        },
        {
            "rcarriga/nvim-dap-ui",
            "jay-babu/mason-nvim-dap.nvim",
            config = function()
                require("mason-nvim-dap").setup({
                    ensure_installed = { "codelldb" }, -- just examples
                    automatic_setup = true,
                })
                require("mason-nvim-dap").setup_handlers()
            end,
        },
    },

    config = function()
        local dap = require("dap")
        local dapui = require("dapui")

        -- Setup dapui first
        dapui.setup()

        -- Automatically open and close UI
        dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close()
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close()
        end

        -- Keymaps mimicking Visual Studio behavior
        vim.keymap.set("n", "<F5>", dap.continue, { desc = "DAP: Continue/Start" })
        vim.keymap.set("n", "<F9>", dap.toggle_breakpoint, { desc = "DAP: Toggle Breakpoint" })
        vim.keymap.set("n", "<F10>", dap.step_over, { desc = "DAP: Step Over" })
        vim.keymap.set("n", "<F11>", dap.step_into, { desc = "DAP: Step Into" })
        vim.keymap.set("n", "<F12>", dap.step_out, { desc = "DAP: Step Out" })
        vim.keymap.set("n", "<F6>", dap.terminate, { desc = "DAP: Stop Debugging" })
        -- vim.keymap.set("n", "<F6>", dap.pause, { desc = "DAP: Pause" })

        -- Optional extras
        -- vim.keymap.set("n", "<Leader>dr", dap.repl.open, { desc = "DAP: Open REPL" })
        vim.keymap.set("n", "<Leader>du", dapui.toggle, { desc = "DAP UI: Toggle" })

        -- Load Go debugging configuration from separate file
        require("dap.go_debug").setup()
        -- Load Rust debugging configuration from separate file
        require("dap.rust_debug").setup()
    end,
}
