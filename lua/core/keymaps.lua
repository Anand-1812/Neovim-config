-- ==============================
-- keymaps.lua
-- Custom key mappings
-- ==============================

local opts = { noremap = true, silent = true }

-- Example keymaps
vim.keymap.set("n", "<leader>ls", ":!live-server %:p:h<CR>", opts)
vim.keymap.set("n", "<leader>w", ":w<CR>", opts)
vim.keymap.set("n", "<leader>q", ":q<CR>", opts)

