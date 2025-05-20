-- return {
-- GitHub Copilot core plugin
-- {
--   "github/copilot.vim",
--   lazy = false, -- load on startup (or true if you want to defer)
-- },
-- GitHub Copilot for Neovim
--   {
--     "zbirenbaum/copilot.lua",
--     event = "InsertEnter",
--     vim.api.nvim_set_keymap("n", "<leader>gc", "<cmd>Copilot panel<CR>", { noremap = true, silent = true, desc = "Open Copilot panel" }),
--     config = function()
--       require("copilot").setup({
--         suggestion = { enabled = true, auto_trigger = false },
--         panel = { enabled = false, auto_refresh = true },
--       })
--     end,
--   },
-- }
--
return {
    {
        "zbirenbaum/copilot.lua",
        event = "InsertEnter",
        config = function()
            require("copilot").setup({
                suggestion = {
                    enabled = true,
                    auto_trigger = true, -- or false if you want manual activation
                    keymap = {
                        -- accept = "<C-l>",
                        accept = "<Tab>",
                        dismiss = "<C-]>",
                    },
                },
                panel = { enabled = false },
            })
        end,
    },
    {
        "zbirenbaum/copilot-cmp",
        dependencies = { "zbirenbaum/copilot.lua" },
        config = function()
            require("copilot_cmp").setup()
        end,
    },
}
