vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set rnu")
vim.cmd("set number")
vim.cmd("set nowrap")
vim.opt.termguicolors = true

require("config.lazy")
require("config.remaps")
require("config.autocmds")
--require("lsp.servers")
require("luasnip.loaders.from_lua").lazy_load({ paths = "~/.config/nvim/lua/snippets" })
