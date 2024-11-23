-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps heredoc
local map = vim.keymap.set

map('n', '<C-p>', "<cmd>Telescope keymaps<CR>")

