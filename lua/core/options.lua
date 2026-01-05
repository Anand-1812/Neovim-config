-- ==============================
-- options.lua
-- Core editor behavior
-- ==============================

-- Suppress the nvim-lspconfig deprecation warning (Neovim 0.11+)
vim.g.lspconfig_framework_deprecation = false

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Indentation: enforce 2 spaces everywhere
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.smartindent = true

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- UI
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"
vim.opt.termguicolors = true
vim.opt.wrap = false

-- Scrolling comfort
vim.opt.scrolloff = 6
vim.opt.sidescrolloff = 8

-- Window behavior
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Folding (safe defaults)
vim.opt.foldmethod = "indent"
vim.opt.foldenable = false
vim.opt.foldlevel = 99

-- Popup polish
vim.opt.winblend = 0
vim.opt.pumblend = 0

-- Leader timeout behavior
vim.opt.timeout = true
vim.opt.timeoutlen = 400

