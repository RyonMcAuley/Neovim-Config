local jdtls = require("jdtls")

-- Detect root OR default to cwd
local root = require("jdtls.setup").find_root({
    ".git", ".root", "mvnw", "gradlew", "pom.xml", "build.gradle"
}) or vim.fn.getcwd()

local workspace = vim.fn.stdpath("data") .. "/jdtls-workspaces/" .. vim.fn.fnamemodify(root, ":p:h:t")

jdtls.start_or_attach({
    cmd = { "jdtls", "-data", workspace },
    root_dir = root,
    on_attach = function(_, bufnr)
        local map = function(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
        end

        map("n", "K", vim.lsp.buf.hover, "Hover Docs")
        map("n", "<leader>rn", vim.lsp.buf.rename, "Rename Symbol")
        map("n", "<leader>ca", vim.lsp.buf.code_action, "Code Action")
    end,
    settings = {
        java = {
            project = {
                sourcePaths = { "src" },
            },
        },
    },
})
