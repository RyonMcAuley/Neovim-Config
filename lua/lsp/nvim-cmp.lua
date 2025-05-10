-- nvim-cmp setup
local cmp = require('cmp')
local lspconfig = require('lspconfig')

-- Setup nvim-cmp
cmp.setup({
    snippet = {
        -- You can use 'LuaSnip' or other snippet engines here
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },

    completion = {
        autocomplete = { cmp.TriggerEvent.TextChanged, cmp.TriggerEvent.InsertEnter },
    },

    mapping = {
        -- Basic completion keybindings
        ['<C-Space>'] = cmp.mapping.complete(),        -- Trigger completion
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Confirm selection
        ['<Tab>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    },

    sources = {
        { name = 'nvim_lsp' }, -- LSP source
        { name = 'buffer' }, -- Buffer source (for in-file completion)
        { name = 'path' }, -- Path source (e.g., for file paths)
        { name = 'luasnip' }, -- Snippet source
        { name = 'rust' }, -- Rust source (if using rust-tools)
    },

    experimental = {
        native_menu = false, -- Use the native menu (optional)
        ghost_text = true, -- Show ghost text (optional)
    },
})

-- Configure OmniSharp LSP
lspconfig.omnisharp.setup({
    cmd = { "C:\\path\\to\\OmniSharp.exe", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
    enable_import_completion = true,
    organize_imports_on_format = true,
})
