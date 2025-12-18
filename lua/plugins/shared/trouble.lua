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
    vim.keymap.set('n', 'gR', function()
    require('trouble').open("lsp_references")
    vim.defer_fn(function()
      vim.cmd("wincmd j")  -- move focus to the window below
    end, 100)
    end, { desc = "LSP references (Trouble with auto focus)" })
  end
}
