return {
    'nvim-lualine/lualine.nvim',  -- Lualine plugin
    dependencies = { 'folke/tokyonight.nvim' },  -- Ensure Tokyonight is loaded
    config = function()
        -- Set the Tokyonight theme
        -- If you've set the colorscheme in your themes.lua file, you don't need this line
        vim.cmd.colorscheme('tokyonight')

        -- Now set up Lualine to use the Tokyonight theme
        require('lualine').setup({
            options = {
                theme = 'tokyonight',  -- Use Tokyonight theme in Lualine
                section_separators = { left = '', right = '' },
                component_separators = { left = '', right = '' },
                icons_enabled = true,  -- Enable icons in the statusline
            },
            sections = {
                lualine_a = { 'mode' },  -- Display mode (e.g., normal, insert)
                lualine_b = { 'branch', 'diff', 'diagnostics' },
                lualine_c = { { 'filename', path = 1 } },  -- Show the full file path
                lualine_x = { 'encoding', 'fileformat', 'filetype' },
                lualine_y = { 'progress' },
                lualine_z = { 'location' },  -- Display the location (line number)
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { { 'filename', path = 1 } },
                lualine_x = { 'location' },
                lualine_y = {},
                lualine_z = {},
            },
            extensions = { 'nvim-tree', 'quickfix' },  -- Enable some extensions if needed
        })
    end,
}

