return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",

  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
    "nvim-treesitter/playground",
    "windwp/nvim-ts-autotag",
    "HiPhish/nvim-ts-rainbow2",
  },

  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "bash", "c", "cpp", "css", "gitcommit", "go", "html", "javascript",
        "json", "lua", "markdown", "python", "ruby", "rust", "toml",
        "typescript", "yaml"
      },

      auto_install = true,

      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },

      indent = {
        enable = true,
      },

      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<CR>",
          node_incremental = "<TAB>",
          node_decremental = "<S-TAB>",
          scope_incremental = "<C-space>",
        },
      },

      autotag = {
        enable = true,
      },

      rainbow = {
        enable = true,
        query = "rainbow-parens",
        strategy = require("ts-rainbow.strategy.global"),
      },

      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
            ["ab"] = "@block.outer",
            ["ib"] = "@block.inner",
          },
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            ["]m"] = "@function.outer",
            ["]]"] = "@class.outer",
          },
          goto_previous_start = {
            ["[m"] = "@function.outer",
            ["[["] = "@class.outer",
          },
        },
      },

      playground = {
        enable = true,
        updatetime = 25,
        persist_queries = false,
      },
    })
  end,
}

