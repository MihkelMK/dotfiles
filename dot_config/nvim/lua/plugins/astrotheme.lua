return {
  {
    "AstroNvim/astrotheme",
    lazy = false,
    priority = 1000,
    config = function()
      require("astrotheme").setup({})
    end,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "astrodark",
    },
  },
}
