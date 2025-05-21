return {
  {
    "williamboman/mason.nvim",
    opts = { ensure_installed = { "jinja-lsp", "djlint" } },
  },
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        jinja_lsp = {},
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        ["jinja"] = { "djlint" },
      },
    },
  },
}
