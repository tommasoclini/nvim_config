-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
vim.api.nvim_create_autocmd("FileType", {
  pattern = "rust",
  group = vim.api.nvim_create_augroup("Rust_disable_single_quote", { clear = true }),
  callback = function()
    MiniPairs.unmap("i", "'", "''")
  end,
  desc = "Disable single quote Rust",
})
