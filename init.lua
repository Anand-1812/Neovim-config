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
vim.opt.cursorline = true          -- Highlight the current line
vim.opt.signcolumn = "yes"         -- Always show the sign column
vim.opt.termguicolors = true       -- Enable true color support
vim.opt.wrap = true                -- Wrap long lines
vim.opt.linebreak = true           -- Break lines at word boundaries
vim.opt.scrolloff = 8              -- Keep 8 lines visible above/below the cursor
vim.opt.sidescrolloff = 8          -- Keep 8 columns visible left/right of the cursor
vim.opt.splitbelow = true          -- Open horizontal splits below
vim.opt.splitright = true          -- Open vertical splits to the right
vim.opt.cmdheight = 2              -- More space in command line for messages
vim.opt.winblend = 10              -- Transparency for floating windows
vim.opt.pumblend = 10              -- Transparency for popup menus
vim.opt.foldmethod = "indent"      -- Use indentation for folding
vim.opt.foldlevel = 99             -- Open folds by default
vim.opt.foldenable = false         -- Disable folding by default

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
