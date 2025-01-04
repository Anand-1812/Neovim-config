-- Tab and indentation options
vim.opt.expandtab = true      -- Use spaces instead of tabs
vim.opt.tabstop = 4           -- Number of spaces tabs count for
vim.opt.softtabstop = 4       -- Number of spaces tabs count for in insert mode
vim.opt.shiftwidth = 4        -- Number of spaces for autoindent
vim.opt.smartindent = true    -- Enable smart indentation

-- Global leader key
vim.g.mapleader = vim.g.mapleader or " "  -- Use space as leader key, but respect existing settings

-- UI settings
vim.opt.number = true         -- Enable absolute line numbers
vim.opt.relativenumber = true -- Enable relative line numbers for better navigation

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({
    "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath,
  })

  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Error cloning lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit...\n", "MoreMsg" },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

-- Add lazy.nvim to runtime path
vim.opt.rtp:prepend(lazypath)

-- Initialize lazy.nvim
local opts = {} -- Add any specific options here if needed
require("lazy").setup("plugins", opts)
