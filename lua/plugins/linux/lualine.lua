return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    event = "VeryLazy",
    config = function()
        -- Bubbles config for lualine
        -- Author: lokesh-krishna
        -- MIT license, see LICENSE for more details.
        -- stylua: ignore

        local colors = {
            blue     = '#80a0ff',
            cyan     = '#79dac8',
            black    = '#080808',
            white    = '#c6c6c6',
            red      = '#ff5189',
            violet   = '#d183e8',
            myaccent = '#9c9c9c',
            grey     = '#303030',
            green    = '#a0db8e',
            yellow   = '#f0d197',
            trans    = '#000000',
        }

        local bubbles_theme = {
            normal = {
                a = { fg = colors.black, bg = colors.myaccent },
                -- a = { fg = colors.black, bg = colors.trans },
                b = { fg = colors.white, bg = colors.grey },
                c = { fg = colors.white, bg = colors.trans },
            },

            insert = { a = { fg = colors.black, bg = colors.blue } },
            visual = { a = { fg = colors.black, bg = colors.cyan } },
            replace = { a = { fg = colors.black, bg = colors.red } },
            command = { a = { fg = colors.black, bg = colors.green } },

            inactive = {
                a = { fg = colors.white, bg = colors.black },
                b = { fg = colors.white, bg = colors.black },
                c = { fg = colors.white, bg = colors.trans },
            },
        }

        local lualine = require('lualine')
        lualine.setup {
            options = {
                theme = bubbles_theme,
                component_separators = '',
                section_separators = { left = '', right = '' },
                globalstatus = true,
                transparent = true,
            },
            sections = {
                lualine_a = {
                    { 'mode', separator = { left = '' }, right_padding = 2 }
                },
                lualine_b = {
                    { 'filename', path = 1 },
                    { 'branch' },
                },
                lualine_c = {
                    {
                        'diagnostics',
                        sources = { 'nvim_diagnostic' },
                        symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
                        colored = true,
                        draw_empty = true,
                        padding = { left = 1, right = 1 }
                    },
                },
                lualine_x = {
                    { 'diff',
                        symbols = { added = ' ', modified = ' ', removed = ' ' },
                        colored = true
                    },
                },
                lualine_y = { 'filetype', 'encoding', 'fileformat', 'progress' },
                lualine_z = {
                    { 'location', separator = { right = '' }, left_padding = 2 },
                },
            },
            inactive_sections = {
                lualine_a = { 'filename' },
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = { 'location' },
            },
            tabline = {},
            extensions = { 'nvim-tree', 'fugitive', 'quickfix' },
        }
    end
}
