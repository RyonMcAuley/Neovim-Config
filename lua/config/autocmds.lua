vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    vim.cmd([[%s/\r//ge]])
  end,
})

--vim.api.nvim_create_autocmd("FileType", {
--  pattern = "copilot-chat",
--  callback = function()
--    vim.keymap.set("i", "<S-CR>", "<cmd>CopilotChatSend<cr>", { noremap = true, silent = true })
--  end,
--})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "copilot-chat",
  callback = function()
    print("[CopilotChat] FileType detected!")  -- ✅ Debug line
    vim.keymap.set('i', '<S-CR>', function()
      vim.api.nvim_feedkeys(
        vim.api.nvim_replace_termcodes('<Esc><CR>', true, false, true),
        'n',
        true
      )
    end, { desc = "Send Copilot Messages", buffer = true })
  end,
})

