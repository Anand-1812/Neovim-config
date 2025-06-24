return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  event = "VeryLazy",

  config = function()
    require("neo-tree").setup({
      close_if_last_window = true,
      popup_border_style = "rounded",

      filesystem = {
        follow_current_file = { enabled = true },
        group_empty_dirs = true,
        hijack_netrw = true,
        use_libuv_file_watcher = true,

        window = {
          width = 30,
          mappings = {
            ["<C-n>"] = "open",
          },
        },
      },

      default_component_configs = {
        container = {
          enable_character_fade = true,
        },
        indent = {
          indent_size = 2,
          padding = 1,
          with_markers = true,
        },
      },
    })

    vim.keymap.set("n", "<C-t>", ":Neotree filesystem reveal left<CR>", { noremap = true, silent = true })
    vim.keymap.set("n", "<C-b>", ":Neotree toggle<CR>", { noremap = true, silent = true })
  end,
}

