return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("trouble").setup {}

    -- Key mappings for Trouble
    local opts = { silent = true, noremap = true }
    local moveOpts = { skip_groups = true, jump = true }

    -- Toggle Trouble
    vim.keymap.set('n', "<leader>tt", '<cmd>Trouble diagnostics toggle<cr>')
    -- Workspace Diagnostics
    vim.keymap.set("n", "<leader>tn", function()
			require("trouble").next( moveOpts, {} )
		end)
    vim.keymap.set("n", "<leader>tp", function()
			require("trouble").prev( moveOpts, {} )
		end)
    -- Quickfix List
    vim.keymap.set("n", "<leader>tq", "<cmd>Trouble qflist toggle<cr>", opts)
    -- Document Diagnostics
    --vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", opts)
    vim.keymap.set("n", "<leader>xd", vim.diagnostic.open_float, opts)
    -- Location List
    vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", opts)
    -- LSP References
    vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", opts)
  end
}
