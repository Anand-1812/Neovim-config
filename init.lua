-- Set global tab and indentation options for all files
vim.opt.expandtab = true      -- Use spaces instead of tabs
vim.opt.tabstop = 4           -- Number of spaces tabs count for
vim.opt.softtabstop = 4       -- Number of spaces in insert mode tabs
vim.opt.shiftwidth = 4        -- Number of spaces for autoindent
vim.opt.smartindent = true    -- Enable smart indentation

vim.g.mapleader = " "


vim.o.number = true        -- Enable line numbers
vim.o.relativenumber = true

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

vim.opt.rtp:prepend(lazypath)


local opts = {}

require("lazy").setup("plugins")

    

