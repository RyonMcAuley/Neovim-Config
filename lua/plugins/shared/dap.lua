-- return {
--     "mfussenegger/nvim-dap"
-- }
return {
    "mfussenegger/nvim-dap",
    dependencies = {
        {
            "rcarriga/nvim-dap-ui",
            dependencies = {
                "nvim-neotest/nvim-nio",
            },
            config = function()
                local dap, dapui = require("dap"), require("dapui")

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
            end,
        },
    },

    config = function()
        local dap = require("dap")

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
        -- vim.keymap.set("n", "<Leader>du", require("dapui").toggle, { desc = "DAP UI: Toggle" })
        local dap = require("dap")

        dap.adapters.go = function(callback, config)
            local handle
            local pid_or_err
            local port = 38697
            handle, pid_or_err = vim.loop.spawn("dlv", {
                args = { "dap", "-l", "127.0.0.1:" .. port },
                detached = true,
            }, function(code)
                handle:close()
                print("Delve exited with exit code: " .. code)
            end)

            -- Wait for delve to start
            vim.defer_fn(function()
                callback({ type = "server", host = "127.0.0.1", port = port })
            end, 100)
        end

        dap.configurations.go = {
            {
                type = "go",
                name = "Debug File",
                request = "launch",
                program = "${file}",
            },
            {
                type = "go",
                name = "Debug Package",
                request = "launch",
                program = "${fileDirname}",
            },
            {
                type = "go",
                name = "Attach to Process",
                mode = "local",
                request = "attach",
                processId = require("dap.utils").pick_process,
            },
        }
    end,
}
