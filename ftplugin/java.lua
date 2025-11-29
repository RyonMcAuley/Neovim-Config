local jdtls = require("jdtls")

-- Detect root OR default to cwd
local root = require("jdtls.setup").find_root({
    ".git", "mvnw", "gradlew", "pom.xml", "build.gradle"
}) or vim.fn.getcwd()

local workspace = vim.fn.stdpath("data") .. "/jdtls-workspaces/" .. vim.fn.fnamemodify(root, ":p:h:t")

jdtls.start_or_attach({
    cmd = { "jdtls", "-data", workspace },
    root_dir = root,
})
