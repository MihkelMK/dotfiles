return {
  {
    "williamboman/mason.nvim",
    opts = { ensure_installed = { "hyprls" } },
  },
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        hyprls = {},
      },
    },
  },
}
