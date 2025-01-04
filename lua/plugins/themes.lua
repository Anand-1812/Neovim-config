-- Tokyonight Theme Configuration
return {
    'folke/tokyonight.nvim',  -- Ensure Tokyonight plugin is loaded
    config = function()
        -- Set Tokyonight as the colorscheme
        vim.cmd.colorscheme('tokyonight')
    end
}

