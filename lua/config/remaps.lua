-- This file contains custom key mappings for Neovim.
-- <C-o> goes back to previous file
-- <C-i> goes forward to next file
-- g; goes to previous change
-- g, goes to next change


vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

-- Map Ctrl+c to Escape in multiple modes
vim.api.nvim_set_keymap('n', '<C-c>', '<Esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-c>', '<Esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-c>', '<Esc>', { noremap = true, silent = true })

-- Move selected lines in Visual mode
vim.api.nvim_set_keymap('v', 'J', ":m '>+1<CR>gv=gv", { noremap = true })
vim.api.nvim_set_keymap('v', 'K', ":m '<-2<CR>gv=gv", { noremap = true })

-- Better scrolling
vim.api.nvim_set_keymap('n', '<C-u>', '<C-u>zz', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-d>', '<C-d>zz', { noremap = true })

-- Better navigation in wrapped lines
-- This is a workaround for the issue where 'j' and 'k' don't work as expected in wrapped lines
vim.api.nvim_set_keymap('n', 'j', 'gj', { noremap = true })
vim.api.nvim_set_keymap('n', 'k', 'gk', { noremap = true })

-- Clear highlighting
vim.api.nvim_set_keymap('n', 'nh', ':noh<CR>', { noremap = true, silent = true })

--Doesn't work
-- vim.api.nvim_set_keymap('n', ':s', [[<Cmd>execute 'normal! :s'<CR>nh]], {noremap = true, silent = true })

-- Quicker window navigation - buggy in VS
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true })
--
--
vim.keymap.set('n', '<leader>gs', OpenLazyGit, { desc = "Open LazyGit" })
--
--vim.keymap.set('i', '<S-CR>', function()
--  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Esc><CR>', true, false, true), 'n', true) end, { desc = "Send Copilot Messages" })
--
