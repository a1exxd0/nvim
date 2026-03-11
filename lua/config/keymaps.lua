-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>h", function()
  vim.cmd("split | terminal")
end, { desc = "Horizontal terminal" })

vim.keymap.set("n", "<leader>v", function()
  vim.cmd("vsplit | terminal")
end, { desc = "Vertical terminal" })

vim.keymap.set("t", "<C-t>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
