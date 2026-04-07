vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set rnu")
vim.cmd("set number")
vim.cmd("set nowrap")
vim.opt.termguicolors = true
vim.env.COLORTERM = "truecolor"
vim.opt.clipboard = "unnamedplus"
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldtext = "v:lua.vim.treesitter.foldtext()"
vim.opt.foldlevel = 99
vim.opt.foldenable = false -- Folds are defined but not closed by default


-- Suppress OmniSharp INVALID_SERVER_MESSAGE spam
local orig_notify = vim.notify
vim.notify = function(msg, level, opts)
    if type(msg) == "string" and msg:match("INVALID_SERVER_MESSAGE") then
        return
    end
    orig_notify(msg, level, opts)
end

require("config.lazy")
require("config.remaps")
require("config.autocmds")
--require("lsp.servers")
require("luasnip.loaders.from_lua").lazy_load({ paths = "~/.config/nvim/lua/snippets" })

-- transparent force
vim.api.nvim_create_autocmd("UIEnter", {
    callback = function()
        vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "LineNr", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "LineNrAbove", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "LineNrBelow", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
        --         vim.api.nvim_set_hl(0, "DiagnosticSignError", { bg = "NONE" })
        -- vim.api.nvim_set_hl(0, "DiagnosticSignWarn", { bg = "NONE" })
        -- vim.api.nvim_set_hl(0, "DiagnosticSignInfo", { bg = "NONE" })
        -- vim.api.nvim_set_hl(0, "DiagnosticSignHint", { bg = "NONE" })
    end,
})
