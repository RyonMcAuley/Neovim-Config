return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    -- or                              , branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },

    config = function()
        require('telescope').setup({
            defaults = {
                file_ignore_patterns = { '%.class' },
            }
        })
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
        vim.keymap.set('n', '<C-p>', builtin.git_files, {})
        vim.keymap.set('n', '<leader>pws', function()
            local word = vim.fn.expand('<cword>')
            builtin.grep_string({ search = word })
        end)
        vim.keymap.set('n', '<leader>pWs', function()
            local word = vim.fn.expand('<cWORD>')
            builtin.grep_string({ search = word })
        end)
        vim.keymap.set('n', '<leader>gr', require('telescope.builtin').lsp_references, {})
        vim.keymap.set('n', '<leader>ds', builtin.lsp_document_symbols, {})
        vim.keymap.set('n', '<leader>ps', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end)
        vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
        vim.keymap.set("n", "gd", function()
            require("telescope.builtin").lsp_definitions()
        end, { desc = "Go to definition (Telescope)" })
    end
}
