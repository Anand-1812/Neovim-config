return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },

  config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    local on_attach = function(_, bufnr)
      local map = vim.keymap.set
      local opts = { buffer = bufnr, silent = true }

      map("n", "gd", vim.lsp.buf.definition, opts)
      map("n", "gr", vim.lsp.buf.references, opts)
      map("n", "K", vim.lsp.buf.hover, opts)
      map("n", "<leader>rn", vim.lsp.buf.rename, opts)
      map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
      map("n", "<leader>f", function()
        vim.lsp.buf.format({ async = true })
      end, opts)
    end

    -- Lua
    vim.lsp.config("lua_ls", {
      cmd = { "lua-language-server" },
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } },
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
        },
      },
    })
    vim.lsp.enable("lua_ls")

    -- Python
    vim.lsp.config("pyright", {
      cmd = { "pyright-langserver", "--stdio" },
      capabilities = capabilities,
      on_attach = on_attach,
    })
    vim.lsp.enable("pyright")

    -- C / C++
    vim.lsp.config("clangd", {
      cmd = { "clangd" },
      capabilities = capabilities,
      on_attach = on_attach,
    })
    vim.lsp.enable("clangd")

    -- JavaScript / TypeScript
    vim.lsp.config("ts_ls", {
      cmd = { "typescript-language-server", "--stdio" },
      capabilities = capabilities,
      on_attach = on_attach,
    })
    vim.lsp.enable("ts_ls")

    -- Tailwind CSS
    vim.lsp.config("tailwindcss", {
      cmd = { "tailwindcss-language-server", "--stdio" },
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = {
        "html",
        "css",
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
      },
    })
    vim.lsp.enable("tailwindcss")
  end,
}

