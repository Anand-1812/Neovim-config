return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "folke/tokyonight.nvim" },

  config = function()
    require("lualine").setup({
      options = {
        theme = "tokyonight",
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

