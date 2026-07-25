-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

vim.keymap.set("x", "<leader>ao", function()
  require("config.omp").ask_selection()
end, { desc = "Ask OMP about selection" })

vim.keymap.set({ "n", "x" }, "<leader>aq", function()
  require("config.omp").ask_floating()
end, { desc = "Ask OMP in a floating pane" })
