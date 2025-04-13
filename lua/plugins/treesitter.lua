return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function ()
    local opts = {
          ensure_installed = { "lua", "vim", "vimdoc", "javascript", "html", "c_sharp", "go", "gomod" },
	  sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },
	}
	require("nvim-treesitter.install").prefer_git = false
	require('nvim-treesitter.install').compilers = { "clang" }
	require('nvim-treesitter.install').arch = "x64"
	require("nvim-treesitter.configs").setup( opts )
    end
}
