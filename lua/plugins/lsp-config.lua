-- ==============================
-- lsp-config.lua
-- Mason + LSP Setup with vim.lsp.config
-- ==============================

return {
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = function()
      require("mason").setup()
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
    },
    config = function()
      local mason_lsp = require("mason-lspconfig")

      mason_lsp.setup({
        ensure_installed = {
          "lua_ls",
          "pyright",
          "clangd",
          "gopls",
          "rust_analyzer",
          "html",
          "cssls",
          "jsonls",
          "yamlls",
          "tailwindcss",
          "ts_ls",
        },
        automatic_installation = true,
      })

      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local on_attach = function(_, bufnr)
        local opts = { buffer = bufnr, noremap = true, silent = true }

        vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>f", function()
          vim.lsp.buf.format({ async = true })
        end, opts)

        vim.keymap.set("n", "<leader>i", function()
          vim.cmd("normal! gg=G")
        end, { buffer = bufnr, desc = "Auto-indent entire file" })
      end

      -- Configure & enable servers
      local servers = {
        "lua_ls",
        "pyright",
        "ts_ls",
        "clangd",
        "gopls",
        "rust_analyzer",
        "html",
        "cssls",
        "jsonls",
        "yamlls",
        "tailwindcss",
      }

      for _, server in ipairs(servers) do
        vim.lsp.config(server, {
          capabilities = capabilities,
          on_attach = on_attach,
        })
        vim.lsp.enable(server)
      end
    end,
  },
}
