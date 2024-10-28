return {
    "akinsho/toggleterm.nvim",
    config = function()
        require("toggleterm").setup({
            size = 80,
            open_mapping = [[<c-\>]], -- try a different key mappinig
            direction = 'vertical', -- or try 'horizontal' to see if the issue is here
            float_opts = {
                border = 'curved',
            }
        })
    end
}
