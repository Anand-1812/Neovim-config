-- ==============================
-- autocommands.lua
-- Small quality-of-life automations
-- ==============================

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Highlight text after yank
autocmd("TextYankPost", {
  group = augroup("YankHighlight", {}),
  callback = function()
    vim.highlight.on_yank({ timeout = 200 })
  end,
})

-- Remove trailing whitespace on save
autocmd("BufWritePre", {
  group = augroup("TrimWhitespace", {}),
  callback = function()
    vim.cmd([[%s/\s\+$//e]])
  end,
})

-- Better diagnostics UI
vim.diagnostic.config({
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = "rounded",
    source = "always",
  },
})
