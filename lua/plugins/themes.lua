return {
	"folke/tokyonight.nvim",

	priority = 1000, -- Load before other plugins

	config = function()
		require("tokyonight").setup({
			style = "moon", -- Options: "storm", "moon", "night", "day"
			transparent = false,
			terminal_colors = true,
			styles = {
				comments = { italic = true },
				keywords = { italic = true },
				functions = {},
				variables = {},
			},
			dim_inactive = true,
			lualine_bold = true,
		})

		vim.cmd.colorscheme("tokyonight")
	end,
}
