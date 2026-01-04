-- ==============================
-- lualine.lua
-- Statusline (Rose Pine)
-- ==============================

return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",

  config = function()
    require("lualine").setup({
      options = {
        theme = "rose-pine",
        icons_enabled = true,

        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },

        disabled_filetypes = {
          "neo-tree",
          "alpha",
        },
      },

      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { { "filename", path = 1 } },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    })
  end,
}
