vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set rnu")
vim.cmd("set number")
vim.cmd("set nowrap")
vim.opt.termguicolors = true
vim.opt.clipboard = "unnamedplus"

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
