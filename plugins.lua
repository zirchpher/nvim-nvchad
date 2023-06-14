local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  { "jose-elias-alvarez/typescript.nvim" }, -- suporte extendido para ts

  -- surrounding
  { "tpope/vim-surround", event = "VeryLazy" },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  -- easyemotion
  {
    "phaazon/hop.nvim",
    branch = "v2", -- optional but strongly recommended
    config = function()
      require("hop").setup { keys = "etovxqpdygfblzhckisuran" }
    end,
  },

  -- tailwind support
  {
    "NvChad/nvim-colorizer.lua",
    opts = {
      user_default_options = {
        tailwind = true,
      },
    },
  },

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      { "roobert/tailwindcss-colorizer-cmp.nvim", config = true },
    },
    opts = function(_, opts)
      local format_kinds = opts.formatting.format
      opts.formatting.format = function(entry, item)
        format_kinds(entry, item) -- add icons
        return require("tailwindcss-colorizer-cmp").formatter(entry, item)
      end
    end,
  },

  {
    "numToStr/Comment.nvim",
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    event = "VeryLazy",
    config = function()
      require "custom.configs.comments"
    end,
  },

  -- import cost
  {
    "barrett-ruth/import-cost.nvim",
    build = "sh install.sh npm",
    event = "VeryLazy",
    config = true,
  },

  -- autocompletado con IA
  {
    "Exafunction/codeium.vim",
    event = "VeryLazy",
    -- new keymaps
    config = function()
      -- -- Insert suggestion
      vim.keymap.set("i", "<C-g>", function()
        return vim.fn["codeium#Accept"]()
      end, { expr = true })

      -- Clear suggestions
      vim.keymap.set("i", "<c-x>", function()
        return vim.fn["codeium#Clear"]()
      end, { expr = true })

      -- not working
      -- Previous suggestion
      -- vim.keymap.set("i", "<C-<>", function()
      --   return vim.fn["codeium#CycleCompletions"](-1)
      -- end, { expr = true })

      -- not working
      -- Next suggestion
      -- vim.keymap.set("i", "<C->>", function()
      --   return vim.fn["codeium#CycleCompletions"](1)
      -- end, { expr = true })
    end,
  },

  -- usemos un manejador de git y github
  {
    "kdheepak/lazygit.nvim",
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    event = "VeryLazy",
  },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins
