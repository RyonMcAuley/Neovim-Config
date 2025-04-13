local lspconfig = require("lspconfig")
local pid = vim.fn.getpid()
local capabilities = require("cmp_nvim_lsp").default_capabilities()

lspconfig.omnisharp.setup({
  cmd = {
    "C:\\ProgramData\\chocolatey\\bin\\OmniSharp.exe", -- absolute path to the omnisharp binary
    "--languageserver",
    "--hostPID",
    tostring(pid),
    "--encoding", "utf-8",
  },
  capabilities = capabilities,
  enable_import_completion = true,
  organize_imports_on_format = true,
  on_attach = function(client, bufnr)
    local ok, omnisharp_extended = pcall(require, "omnisharp_extended")
    if not ok then return end

-- annoying, not working, use telescope instead
--    vim.keymap.set("n", "gd", function()
--      omnisharp_extended.goto_definition(client, bufnr)
--    end, { buffer = bufnr, desc = "Go to definition" })

  local opts = { buffer = bufnr, desc = "Go to definition (no warn)" }
  -- vim.keymap.set("n", "gd", function()
  --   local notify = vim.notify
  --   vim.notify = function() end
  --   require("telescope.builtin").lsp_definitions()
  --   vim.defer_fn(function()
  --     vim.notify = notify
  --             end, 100)
  --           end, opts)
  --
  --   require('cmp').setup.buffer({
  --     enabled = false,
  --     sources = {
  --       { name = 'nvim_lsp' },
  --   }
  --   })
  -- end,
  vim.keymap.set("n", "gd", function()
  require("telescope.builtin").lsp_definitions()
  end, { desc = "Go to definition (Telescope)" })
  end,

  handlers = {
    ["textDocument/definition"] = require("omnisharp_extended").handler,
  },
})

require("lsp.go-lsp")
