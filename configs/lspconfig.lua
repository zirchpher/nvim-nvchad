local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

local status, typescript = pcall(require, "typescript")
if not status then
  return
end

-----------------------------
-- WEBDEV STUFF
-----------------------------

-- if you just want default config for the servers then put them in a table
local servers = { "html", "emmet_ls", "cssmodules_ls", "cssls", "tailwindcss", "jsonls", "eslint" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- tsserver con algunos keywords de react
typescript.setup {
  server = {
    capabilities = capabilities,
    on_attach = on_attach,
  },

  filetypes = { "typescriptreact", "javascriptreact" },
}
