return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  cmd = "Telescope",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },

  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<CR>" },
    { "<leader>fg", "<cmd>Telescope live_grep<CR>" },
    { "<leader>fb", "<cmd>Telescope buffers<CR>" },
    { "<leader>fh", "<cmd>Telescope help_tags<CR>" },
  },

  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        preview = {
          treesitter = false, -- IMPORTANT
        },

        prompt_prefix = "   ",
        selection_caret = "❯ ",
        entry_prefix = "  ",

        sorting_strategy = "ascending",
        layout_strategy = "horizontal",

        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
          },
          width = 0.9,
          height = 0.85,
        },

        mappings = {
          i = {
            ["<Esc>"] = actions.close,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
          },
        },

        file_ignore_patterns = {
          "node_modules",
          ".git/",
          "dist",
          "build",
        },
      },
    })
  end,
}

