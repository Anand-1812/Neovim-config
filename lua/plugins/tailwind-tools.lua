-- lua/plugins/tailwind-tools.lua
return {
  "luckasRanarison/tailwind-tools.nvim",
  build = ":UpdateRemotePlugins",
  event = "VeryLazy",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-telescope/telescope.nvim",
  },
  opts = {
    lsp = {
      enabled = false, -- IMPORTANT: Set to false to prevent the lspconfig crash
    },
    document_color = {
      enabled = true,
      kind = "background",
    },
    sorting = {
      enabled = true,
    },
  },
}
