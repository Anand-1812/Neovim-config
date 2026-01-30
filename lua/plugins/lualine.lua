return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },

  config = function()
    local colors = {
      bg = "#191724",
      fg = "#e0def4",
      rose = "#eb6f92",
      pine = "#31748f",
      foam = "#9ccfd8",
      iris = "#c4a7e7",
      gold = "#f6c177",
      muted = "#6e6a86",
    }

    local bubbles_theme = {
      normal = {
        a = { fg = colors.bg, bg = colors.rose, gui = "bold" },
        b = { fg = colors.fg, bg = colors.muted },
        c = { fg = colors.fg, bg = colors.bg },
      },
      insert = {
        a = { fg = colors.bg, bg = colors.foam, gui = "bold" },
      },
      visual = {
        a = { fg = colors.bg, bg = colors.iris, gui = "bold" },
      },
      replace = {
        a = { fg = colors.bg, bg = colors.gold, gui = "bold" },
      },
      inactive = {
        a = { fg = colors.muted, bg = colors.bg },
        b = { fg = colors.muted, bg = colors.bg },
        c = { fg = colors.muted, bg = colors.bg },
      },
    }

    require("lualine").setup({
      options = {
        theme = bubbles_theme,
        globalstatus = true,
        section_separators = { left = "", right = "" },
        component_separators = "",
        icons_enabled = true,
        disabled_filetypes = { "neo-tree", "dashboard" },
      },

      sections = {
        lualine_a = {
          { "mode", icon = "" },
        },

        lualine_b = {
          { "branch", icon = "" },
          {
            "diff",
            symbols = { added = " ", modified = " ", removed = " " },
          },
        },

        lualine_c = {
          {
            "filename",
            path = 1,
            symbols = {
              modified = " ●",
              readonly = " ",
              unnamed = " [No Name]",
            },
          },
        },

        lualine_x = {
          {
            "diagnostics",
            sources = { "nvim_diagnostic" },
            symbols = {
              error = " ",
              warn = " ",
              info = " ",
              hint = "󰌵 ",
            },
          },
          {
            function()
              local clients = vim.lsp.get_clients({ bufnr = 0 })
              if next(clients) == nil then
                return ""
              end
              return "  LSP"
            end,
          },
          "encoding",
          "filetype",
        },

        lualine_y = {
          { "progress" },
        },

        lualine_z = {
          { "location" },
        },
      },

      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
          { "filename", path = 1 },
        },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
    })
  end,
}

