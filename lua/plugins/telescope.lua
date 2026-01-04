-- ==============================
-- telescope.lua
-- Fuzzy finder (files, grep, buffers, help)
-- ==============================

return {
  -- Telescope core
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },

    config = function()
      local telescope = require("telescope")
      local builtin = require("telescope.builtin")

      telescope.setup({
        defaults = {
          -- Layout
          layout_strategy = "flex",
          layout_config = {
            horizontal = { preview_width = 0.6 },
            vertical = { preview_height = 0.5 },
          },

          -- Sorting
          sorting_strategy = "ascending",

          -- Visual polish (matches Rose Pine)
          winblend = 10,
          border = true,
          borderchars = {
            "─", "│", "─", "│",
            "╭", "╮", "╯", "╰",
          },

          -- Prompt UI
          prompt_prefix = "   ",
          selection_caret = "❯ ",
          entry_prefix = "  ",

          -- Better path display
          path_display = { "truncate" },
        },
      })

      -- Keymaps
      local opts = { noremap = true, silent = true }

      vim.keymap.set(
        "n",
        "<C-p>",
        builtin.find_files,
        vim.tbl_extend("force", opts, { desc = "Find files" })
      )

      vim.keymap.set(
        "n",
        "<leader>fg",
        builtin.live_grep,
        vim.tbl_extend("force", opts, { desc = "Live grep" })
      )

      vim.keymap.set(
        "n",
        "<leader>fb",
        builtin.buffers,
        vim.tbl_extend("force", opts, { desc = "Find buffers" })
      )

      vim.keymap.set(
        "n",
        "<leader>fh",
        builtin.help_tags,
        vim.tbl_extend("force", opts, { desc = "Help tags" })
      )

      vim.keymap.set(
        "n",
        "<leader>fr",
        builtin.resume,
        vim.tbl_extend("force", opts, { desc = "Resume last search" })
      )
    end,
  },

  -- Telescope UI Select (nice dropdowns for LSP/code actions)
  {
    "nvim-telescope/telescope-ui-select.nvim",

    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = require("telescope.themes").get_dropdown({
            previewer = false,
            winblend = 10,
            borderchars = {
              "─", "│", "─", "│",
              "╭", "╮", "╯", "╰",
            },
          }),
        },
      })

      require("telescope").load_extension("ui-select")
    end,
  },
}
