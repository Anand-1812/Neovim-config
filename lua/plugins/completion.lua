-- ==============================
-- completion.lua
-- Autocompletion with nvim-cmp
-- ==============================

return {
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",               -- LSP completions
      "hrsh7th/cmp-buffer",                 -- buffer words
      "hrsh7th/cmp-path",                   -- filesystem paths
      "L3MON4D3/LuaSnip",                   -- snippet engine
      "saadparwaiz1/cmp_luasnip",           -- connect snippets to cmp
      "rafamadriz/friendly-snippets",       -- ✅ actual snippets
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      -- Load VSCode-style snippets
      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        -- This mapping block is now fixed.
        -- <Tab> will now use your settings from options.lua.
        -- Use <Enter> to confirm a completion.
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
        }, {
          { name = "buffer" },
          { name = "path" },
        }),
      })
    end,
  },
}
