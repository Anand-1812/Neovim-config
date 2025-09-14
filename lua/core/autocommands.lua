-- ==============================
-- autocommands.lua
-- Custom autocommands
-- ==============================

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Highlight yanked text
autocmd("TextYankPost", {
    group = augroup("YankHighlight", {}),
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({ timeout = 200 })
    end,
})

-- Automatically remove trailing whitespace on save
autocmd("BufWritePre", {
    group = augroup("TrimWhitespace", {}),
    pattern = "*",
    callback = function()
        vim.cmd([[%s/\s\+$//e]])
    end,
})

