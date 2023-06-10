local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

local status, typescript = pcall(require, "typescript")
if not status then
  return
end

lspconfig.html.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "html" },
}

lspconfig.emmet_ls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { "html", "typescriptreact", "javascriptreact" },
}

lspconfig.cssls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "css", "scss", "less" },
}

-- tsserver con algunos keywords de react
typescript.setup {
  server = {
    capabilities = capabilities,
    on_attach = on_attach,
  },

  filetypes = { "typescriptreact", "javascriptreact" },
}

lspconfig.tailwindcss.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

-- if you just want default config for the servers then put them in a table
-- local servers = { "tailwindcss", "emmet_ls", "html", "cssls", "tsserver" }

-- for _, lsp in ipairs(servers) do
--   lspconfig[lsp].setup {
--     on_attach = on_attach,
--     capabilities = capabilities,
--   }
-- end

-- lspconfig.pyright.setup { blabla}
