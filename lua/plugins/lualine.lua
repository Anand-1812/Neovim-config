-- ==============================
-- lualine.lua
-- Statusline setup with Catppuccin theme
-- ==============================

return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "catppuccin/nvim" }, -- Catppuccin theme

    config = function()
        -- Ensure Catppuccin is loaded
        require("catppuccin").setup({
            flavour = "mocha", -- latte, frappe, macchiato, mocha
            transparent_background = false,
            integrations = { lualine = true },
        })
        vim.cmd([[colorscheme catppuccin]])

        -- Lualine setup
        require("lualine").setup({
            options = {
                theme = "catppuccin",
                icons_enabled = true,
                section_separators = { left = "", right = "" },
                component_separators = { left = "", right = "" },
                disabled_filetypes = { "alpha", "dashboard", "NvimTree" },
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "branch", "diff", "diagnostics" },
                lualine_c = { { "filename", path = 1 } },
                lualine_x = { "encoding", "fileformat", "filetype" },
                lualine_y = { "progress" },
                lualine_z = { "location" },
            },
            inactive_sections = {
                lualine_c = { { "filename", path = 1 } },
                lualine_x = { "location" },
            },
            extensions = { "neo-tree", "quickfix" },
        })
    end,
}

