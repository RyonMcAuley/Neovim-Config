local lspconfig = require("lspconfig")
local pid = vim.fn.getpid()

lspconfig.omnisharp.setup({
  cmd = {
    "C:\\ProgramData\\chocolatey\\bin\\OmniSharp.exe", -- absolute path to the omnisharp binary
    "--languageserver",
    "--hostPID",
    tostring(pid),
  },
  enable_import_completion = true,
  organize_imports_on_format = true,
  on_attach = function(client, bufnr)
    require('cmp').setup.buffer({
      sources = {
        { name = 'nvim_lsp' },
    }
    })
  end,
  handlers = {
    ["textDocument/definition"] = require("omnisharp_extended").handler,
  },
})

