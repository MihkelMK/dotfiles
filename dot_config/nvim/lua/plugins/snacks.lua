return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    input = {
      win = {
        relative = "cursor",
      },
    },
    indent = {
      animate = {
        enabled = false,
      },
    },
    terminal = {
      win = {
        border = "rounded",
      },
    },
    picker = {
      sources = {
        explorer = {
          win = {
            input = {
              keys = {
                ["<leader>,"] = false,
                ["<leader>/"] = false,
              },
            },
          },
        },
      },
    },
  },
  keys = {
    { "<leader>,", false },
    { "<leader>/", false },
    {
      "<leader>:",
      function()
        Snacks.picker.command_history()
      end,
      desc = "Command History",
    },
  },
}
