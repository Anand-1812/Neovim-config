-- ==============================
-- tailwind-tools.lua
-- Tailwind utilities (LSP disabled - handled by lsp-config.lua)
-- ==============================

return {
  "luckasRanarison/tailwind-tools.nvim",
  build = ":UpdateRemotePlugins",
  event = "VeryLazy",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-telescope/telescope.nvim",
  },
  opts = {
    -- IMPORTANT: Disable LSP here since we configure tailwindcss in lsp-config.lua
    lsp = {
      enabled = false,
    },
    -- Keep the visual features
    document_color = {
      enabled = true,
      kind = "background",
    },
    conceal = {
      enabled = false,
    },
    sorting = {
      enabled = true,
    },
  },
}