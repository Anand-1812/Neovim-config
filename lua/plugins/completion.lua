return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
  },

  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    -- Load snippets (JS/TS/React included)
    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      completion = {
        completeopt = "menu,menuone,noinsert",
      },

      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },

      mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),

        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      }),

      sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
      },

      formatting = {
        fields = { "abbr", "kind", "menu" },

        format = function(entry, item)
          -- Minimal, readable icons only
          local kind_icons = {
            Function = "󰊕",
            Method = "󰆧",
            Variable = "󰀫",
            Field = "󰜢",
            Class = "󰠱",
            Interface = "",
            Module = "",
            Property = "󰜢",
            Keyword = "󰌋",
            Snippet = "",
            File = "󰈙",
            Folder = "󰉋",
          }

          item.kind = (kind_icons[item.kind] or "") .. " " .. item.kind

          item.menu = ({
            nvim_lsp = "LSP",
            luasnip = "SNIP",
            buffer = "BUF",
            path = "PATH",
          })[entry.source.name]

          return item
        end,
      },
    })
  end,
}

