-- lua/plugins/lsp-config.lua
return {
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      -- 1. Setup Mason FIRST (Fixes the "mason.nvim has not been set up" error)
      require("mason").setup()

      -- 2. Setup Mason-LSPConfig
      local mason_lspconfig = require("mason-lspconfig")
      mason_lspconfig.setup({
        ensure_installed = {
          "lua_ls", "pyright", "clangd", "gopls", "rust_analyzer",
          "html", "cssls", "jsonls", "yamlls", "tailwindcss", "ts_ls",
        },
        automatic_installation = true,
      })

      -- 3. Global LSP Keybindings (Native 0.11 approach)
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          local opts = { buffer = ev.buf, noremap = true, silent = true }
          vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
          vim.keymap.set("n", "<leader>f", function()
            vim.lsp.buf.format({ async = true })
          end, opts)
          vim.keymap.set("n", "<leader>i", function()
            vim.cmd("normal! gg=G")
          end, { buffer = ev.buf, desc = "Auto-indent entire file" })
        end,
      })

      -- 4. Native 0.11 LSP Enable (Fixes the "require('lspconfig') is deprecated" error)
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local servers = {
        "lua_ls", "pyright", "ts_ls", "clangd", "gopls",
        "rust_analyzer", "html", "cssls", "jsonls", "yamlls",
      }

      for _, server in ipairs(servers) do
        -- Use native API to configure and enable
        vim.lsp.config(server, { capabilities = capabilities })
        vim.lsp.enable(server)
      end

      -- Manual Tailwind config (replacing your old tailwinds.lua)
      vim.lsp.config("tailwindcss", {
        capabilities = capabilities,
        settings = {
          tailwindCSS = {
            experimental = {
              classRegex = { "tw`([^`]*)", 'tw="([^"]*)', 'tw={"([^\"}]*)' },
            },
          },
        },
      })
      vim.lsp.enable("tailwindcss")
    end,
  },
}
