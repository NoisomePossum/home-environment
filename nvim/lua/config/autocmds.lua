-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

----------------------COMMANDS-----------------------------

local api = vim.api

local numToggle = api.nvim_create_augroup("ToggleAbsNumber", { clear = true })
api.nvim_create_autocmd("BufLeave, CmdLineEnter, FocusLost, InsertEnter, WinLeave", {
  command = "set nu nornu | redraw",
  group = numToggle,
})
api.nvim_create_autocmd("BufEnter,CmdlineLeave,FocusGained,InsertLeave,WinEnter", {
  command = "set rnu",
  group = numToggle,
})
