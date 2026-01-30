return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },

  config = function()
    local dashboard = require("dashboard")

    dashboard.setup({
      theme = "doom",

      config = {
        header = {
          "",
          "   ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
          "   ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
          "   ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
          "   ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
          "   ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
          "   ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
          "",
          "           Neovim • calm • sharp • fast",
          "",
        },

        center = {
          {
            icon = "  ",
            desc = "New file",
            action = "enew",
          },
          {
            icon = "  ",
            desc = "Find file",
            action = "Telescope find_files",
          },
          {
            icon = "󰈚  ",
            desc = "Recent files",
            action = "Telescope oldfiles",
          },
          {
            icon = "  ",
            desc = "File explorer",
            action = "Neotree toggle",
          },
          {
            icon = "󰊳  ",
            desc = "Git status",
            action = "Telescope git_status",
          },
          {
            icon = "󰒲  ",
            desc = "Lazy",
            action = "Lazy",
          },
          {
            icon = "󰗼  ",
            desc = "Quit",
            action = "qa",
          },
        },

        footer = {
          "",
          "⚡ Ready to hack",
        },
      },
    })
  end,
}

