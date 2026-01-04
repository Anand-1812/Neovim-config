-- ==============================
-- tailwind-tools.lua
-- Tailwind CSS utilities (LSP-safe)
-- ==============================

return {
  "luckasRanarison/tailwind-tools.nvim",
  build = ":UpdateRemotePlugins",
  event = "VeryLazy",

  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-telescope/telescope.nvim", -- optional but useful
  },

  opts = {
    -- IMPORTANT:
    -- Disable LSP handling here.
    -- We use Neovim 0.11's native vim.lsp.config instead.
    lsp = {
      enabled = false,
    },

    -- Highlight Tailwind colors inline
    document_color = {
      enabled = true,
      kind = "background", -- subtle and readable
    },

    -- Sort Tailwind classes on save
    sorting = {
      enabled = true,
      preset = "default",
    },
  },
}
