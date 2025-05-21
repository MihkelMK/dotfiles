return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      table.insert(opts.ensure_installed, "shellcheck")
      table.insert(opts.ensure_installed, "shfmt")
    end,
  },
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      table.insert(opts.formatters_by_ft, {
        sh = { "shfmt" },
      })
    end,
  },
  {
    "mfussenegger/nvim-lint",
    opts = function(_, opts)
      table.insert(opts.linters_by_ft, {
        sh = { "shellcheck" },
      })
    end,
  },
}
