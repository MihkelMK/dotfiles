-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Overwrite terminal (float alwats)
vim.keymap.set("n", "<leader>fT", function()
  Snacks.terminal("zsh")
end, { desc = "Terminal (cwd)" })

vim.keymap.set("n", "<leader>ft", function()
  Snacks.terminal("zsh", { cwd = LazyVim.root() })
end, { desc = "Terminal (Root Dir)" })

vim.keymap.set("n", "<c-/>", function()
  Snacks.terminal("zsh")
end, { desc = "Terminal (cwd)" })

vim.keymap.set("n", "<c-_>", function()
  Snacks.terminal("zsh", { cwd = LazyVim.root() })
end, { desc = "which_key_ignore" })

vim.keymap.set("n", "q:", ":")
