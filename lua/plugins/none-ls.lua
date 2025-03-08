return {
    "nvimtools/none-ls.nvim",  -- Ensure null-ls is installed
    config = function()
        local null_ls = require("null-ls")

        -- Configure null-ls with formatting sources
        null_ls.setup({
            sources = {
                -- Add more sources as needed for linting, formatting, etc.
                null_ls.builtins.formatting.stylua,   -- Lua formatter
                null_ls.builtins.formatting.prettier, -- Prettier for JavaScript, HTML, etc.
                -- You can add more built-ins here, like eslint_d, black, etc.
                null_ls.builtins.diagnostics.rubocop,
                null_ls.builtins.formatting.rubocop,
            },
            on_attach = function(client)
                -- Check if the LSP client supports document formatting using the updated field
                if client.server_capabilities.documentFormattingProvider then
                    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { buffer = 0, noremap = true, silent = true })
                end
            end,
        })
    end,
}

