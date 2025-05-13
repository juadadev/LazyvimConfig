-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- ~/.config/nvim/lua/plugins/windows-keymaps.lua
-- ~/.config/nvim/lua/config/keymaps.lua
--
local map = vim.keymap.set

-- Sobrescribir keymaps aquí (pero no eliminar los del core)
-- Cloes current window
map("n", "<leader>wd", "<cmd>close<cr>", { desc = "Cerrar ventana actual" })
