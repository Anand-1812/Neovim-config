return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000, -- Load before other plugins
    config = function()
        require("catppuccin").setup({
            flavour = "mocha", -- latte, frappe, macchiato, mocha
            transparent_background = false,
            term_colors = true,
            styles = {
                comments = { "italic" },
                conditionals = { "italic" },
                functions = {},
                keywords = {},
                strings = {},
                variables = {},
            },
            dim_inactive = { enabled = true, shade = "dark", percentage = 0.15 },
            integrations = {
                lualine = true,
                telescope = true,
                nvimtree = true,
                treesitter = true,
                cmp = true,
                gitsigns = true,
                notify = true,
                which_key = true,
            },
        })

        vim.cmd.colorscheme("catppuccin")
    end,
}
