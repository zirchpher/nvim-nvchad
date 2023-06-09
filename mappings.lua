---@type MappingsTable
local M = {}

M.general = {
  n = {
    ["<C-a>"] = { "gg<S-v>G", "copy all lines" },
    ["x"] = { '"_x', "delete single character without copying into register" },

    -- Resize window using <ctrl> arrow keys
    ["<C-Up>"] = { "<cmd>resize +2<cr>", "Increase window height" },
    ["<C-Down>"] = { "<cmd>resize -2<cr>", "Decrease window height" },
    ["<C-Left>"] = { "<cmd>vertical resize -2<cr>", "Decrease window width" },
    ["<C-Right>"] = { "<cmd>vertical resize +2<cr>", "Increase window width" },

    -- Move Lines
    ["<A-j>"] = { "<cmd>m .+1<cr>==", "Move down" },
    ["<A-k>"] = { "<cmd>m .-2<cr>==", "Move up" },

    -- Search and exchange of words
    ["gw"] = { "*N", "Search word under cursor" },
    -- ["_"] = { "*Ncgn", "change similar words using . (punto)", opts = { nowait = true } },
    ["<C-d>"] = { "*Ncgn", "change similar words using . (punto)", opts = { nowait = true } },
    [";"] = { ":%s/", "enter change word mode", opts = { nowait = true } },

    -- Copy and page line
    ["<M-C-j>"] = { "yyp", "copy and paste the current line to down" },
    ["<M-C-k>"] = { "yyp", "copy and paste the current line to up" },

    -- increment/decrement numbers
    ["+"] = { "<C-a>", "increment number" },
    ["-"] = { "<C-x>", "decrement number" },

    -----------------------------
    -- Plugins Keymaps
    -----------------------------

    -- Lazy
    ["<leader>l"] = { "<cmd>:Lazy<cr>", "open Lazy" },

    -- transparency
    ["<leader>tt"] = {
      function()
        require("base46").toggle_transparency()
      end,
      "toggle transparency",
    },

    -- easymotion
    ["f"] = {
      function()
        require("hop").hint_char1 { direction = { nil }, current_line_only = false }
      end,
      "easymotion",
    },
  },

  i = {
    -- Move Lines
    ["<A-j>"] = { "<esc><cmd>m .+1<cr>==gi", "Move down" },
    ["<A-k>"] = { "<esc><cmd>m .-2<cr>==gi", "Move up" },

    -- save files
    ["<C-s>"] = { "<cmd>w<cr><esc>", "Save file" },
  },

  v = {
    -- Move Lines
    ["<A-j>"] = { ":m '>+1<cr>gv=gv", "Move down" },
    ["<A-k>"] = { ":m '<-2<cr>gv=gv", "Move up" },

    -- save files
    ["<C-s>"] = { "<cmd>w<cr><esc>", "Save file" },

    -- better indenting
    ["<"] = { "<gv", "better indenting to left side" },
    [">"] = { ">gv", "better indenting to left side" },

    -- easymotion
    ["f"] = {
      function()
        require("hop").hint_char1 { direction = { nil }, current_line_only = false }
      end,
      "easymotion",
    },
  },
}

-- more keybinds!

return M
