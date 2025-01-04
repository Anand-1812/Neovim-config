return {
    "akinsho/toggleterm.nvim",
    config = function()
        require("toggleterm").setup({
            size = 80,  -- Terminal size
            open_mapping = [[<C-\>]],  -- Keybinding to open terminal
            direction = 'vertical',   -- Open terminal in vertical mode (can also use 'horizontal')
            float_opts = {
                border = 'curved',  -- Border style for the floating terminal
            },
            highlights = {
                Normal = { fg = "#c0caf5", bg = "#1a1b26" },  -- Adjust text and background color
                NormalFloat = { fg = "#f8f8f2", bg = "#282a36" },  -- Floating terminal colors
            }
        })
    end
}

