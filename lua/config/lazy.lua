-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"


local uname = vim.loop.os_uname().sysname


local plugins = {
    { import = "plugins.shared" },
}
if uname == "Linux" then
    table.insert(plugins, { import = "plugins.linux" })
    -- vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46_cache/"
end
-- Setup lazy.nvim
require("lazy").setup({
    spec = {
        -- import your plugins
        --import = plugins
        plugins
    },
    -- Configure any other settings here. See the documentation for more details.
    -- colorscheme that will be used when installing plugins.
    -- install = { colorscheme = { "habanax" } },
    -- automatically check for plugin updates
    checker = { enabled = true },
})

-- if uname == "Linux" then
--     dofile(vim.g.base46_cache .. "defaults")
--     dofile(vim.g.base46_cache .. "statusline")
-- end
-- require('base46').toggle_transparency()

-- vim.api.nvim_create_autocmd("User", {
--   pattern = "VeryLazy",
--   callback = function()
--     require("base46").toggle_transparency()
--   end,
-- })

if uname == "Windows_NT" then
    -- require("oxocarbon")
    -- require("onedark").load()
    -- require("catppuccin").setup({
    --   flavor = "auto",
    --   transparent_background = false,
    --   term_colors = true,
    -- })
    -- require("catppuccin").load()
end
