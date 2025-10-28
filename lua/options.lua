require "nvchad.options"

-- add yours here!

vim.keymap.set("t", "<C-t>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
require("nvim-tree").setup {
  filters = {
    git_ignored = false, -- show .gitignored files
  }
}
