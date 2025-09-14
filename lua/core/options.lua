-- ==============================
-- options.lua
-- UI and editing options
-- ==============================

-- Tabs & indentation
vim.opt.expandtab       = true
vim.opt.tabstop         = 4
vim.opt.softtabstop     = 4
vim.opt.shiftwidth      = 4
vim.opt.smartindent     = true

-- Leader key
vim.g.mapleader = vim.g.mapleader or " "

-- UI
vim.opt.number          = true
vim.opt.relativenumber  = true
vim.opt.cursorline      = true
vim.opt.signcolumn      = "yes"
vim.opt.termguicolors   = true
vim.opt.wrap            = true
vim.opt.linebreak       = true
vim.opt.scrolloff       = 8
vim.opt.sidescrolloff   = 8
vim.opt.splitbelow      = true
vim.opt.splitright      = true
vim.opt.cmdheight       = 2
vim.opt.winblend        = 10
vim.opt.pumblend        = 10

-- Folding
vim.opt.foldmethod      = "indent"
vim.opt.foldlevel       = 99
vim.opt.foldenable      = false

