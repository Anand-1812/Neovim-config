return {
    -- Mason for managing LSP servers
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    -- Mason LSP config for auto-installing LSP servers
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                auto_install = true,  -- Automatically install LSP servers
            })
        end
    },
    -- LSP configuration using nvim-lspconfig
    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()  -- Setup capabilities for LSP autocompletion
            local lspconfig = require("lspconfig")

            -- List of language servers to setup
            local servers = {
                "lua_ls", "clangd", "ts_ls", "pyright", "jdtls", "rubyfmt", "html", "cssls", "eslint"
            }

            -- Setup each language server with default capabilities
            for _, server in ipairs(servers) do
                lspconfig[server].setup({
                    capabilities = capabilities
                })
            end

            -- Key mappings for LSP functionality
            local opts = { noremap = true, silent = true }
            vim.keymap.set('n', '<leader>K', vim.lsp.buf.hover, opts)        -- Hover documentation
            vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, opts)  -- Go to definition
            vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts) -- Code action
            vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, opts)  -- Find references
            vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)      -- Rename symbol
            vim.keymap.set('n', '<leader>f', function()
                vim.lsp.buf.format({ async = true })                         -- Format code
            end, opts)
        end
    }
}

