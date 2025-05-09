return {
    "mikavilpas/yazi.nvim", -- or use SSH: "git@github.com:mikavilpas/yazi.nvim.git"
    cmd = "Yazi",
    keys = {
        { "<leader>fy", "<cmd>Yazi<CR>", desc = "Yazi File Manager" },
    },
    opts = {
        open_in_nvim = true, -- opens the selected file in the current Neovim instance
    },
}
