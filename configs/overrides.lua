local M = {}

M.treesitter = {
  ensure_installed = {
    -- neovim stuff
    "vim",
    "lua",
    -- web stuff
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "markdown",
    "markdown_inline",
    "json",
    "yaml",
    "gitignore",
    -- "dockerfile",
    -- linux stuff
    "bash",
  },
  indent = {
    enable = true,
    disable = { "python" },
  },
  auto_install = true,
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",

    -- web dev stuff
    "html-lsp",
    "emmet-ls",
    "css-lsp",
    "typescript-language-server",
    "tailwindcss-language-server",

    -- formatters
    "stylua", -- lua
    "deno", -- ts tsx jsx js
    "prettier", -- html css ts tsx js jsx ...
    "eslint_d", -- tsx ts jsx js
  },
  automatic_installation = true,
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

return M
