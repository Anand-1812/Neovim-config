-- ==============================
-- init.lua
-- Main entry point
-- ==============================

-- ------------------------------------------------
-- Bootstrap lazy.nvim
-- ------------------------------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.loop or vim.uv).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- ------------------------------------------------
-- Core configuration
-- ------------------------------------------------
require("core.options")
require("core.keymaps")
require("core.autocommands")

-- ------------------------------------------------
-- Plugins
-- ------------------------------------------------
require("lazy").setup("plugins")