return {
  "akinsho/toggleterm.nvim",
  version = "*",

  config = function()
    require("toggleterm").setup({
      size = 80,
      open_mapping = [[<C-\>]],
      start_in_insert = true,
      direction = "vertical",
      persist_size = true,
      shade_terminals = true,
      shading_factor = 2,

      float_opts = {
        border = "curved",
        winblend = 0,
      },

      highlights = {
        Normal = { fg = "#c0caf5", bg = "#1a1b26" },
        NormalFloat = { fg = "#f8f8f2", bg = "#282a36" },
      },
    })
  end,
}

