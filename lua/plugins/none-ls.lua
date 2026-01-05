-- ==============================
-- none-ls.lua
-- null-ls setup for formatting and diagnostics
-- ==============================

return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.diagnostics.rubocop,
        null_ls.builtins.formatting.rubocop,
      },

      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          local opts = { noremap = true, silent = true, desc = "Format buffer" }

          -- Keymap to format buffer
          vim.keymap.set("n", "<leader>gf", function()
            vim.lsp.buf.format({ bufnr = bufnr })
          end, opts)

          -- Optional: Autoformat on save
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ bufnr = bufnr })
            end,
          })
        end
      end,
    })
  end,
}