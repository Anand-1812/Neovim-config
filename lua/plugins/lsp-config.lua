-- ==============================
-- lsp-config.lua
-- Mason + LSP Setup with nvim-lspconfig
-- ==============================

return {
    -- Mason for managing LSP servers
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        config = function()
            require("mason").setup()
        end,
    },

    -- Base LSP config
    {
        "neovim/nvim-lspconfig",
        config = function()
            -- Servers are configured via mason-lspconfig
        end,
    },

    -- Mason integration with nvim-lspconfig
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "neovim/nvim-lspconfig",
        },
        config = function()
            local mason_lsp = require("mason-lspconfig")
            mason_lsp.setup({
                ensure_installed = {
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
                },
                automatic_installation = true,
                automatic_enable = false,
            })

            local lspconfig = require("lspconfig")
            local capabilities = vim.lsp.protocol.make_client_capabilities()

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
            }

            for _, server in ipairs(servers) do
                lspconfig[server].setup({
                    capabilities = capabilities,
                    on_attach = function(_, bufnr)
                        local opts = { buffer = bufnr, noremap = true, silent = true }

                        -- LSP keymaps
                        vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts)
                        vim.keymap.set("n", "<leader>K", vim.lsp.buf.hover, opts)
                        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
                        vim.keymap.set("n", "<leader>f", function()
                            vim.lsp.buf.format({ async = true })
                        end, opts)

                        -- Simple auto-indent for entire file (gg=G)
                        vim.keymap.set("n", "<leader>i", function()
                            vim.cmd("normal! gg=G")
                        end, { buffer = bufnr, desc = "Auto-indent entire file" })
                    end,
                })
            end
        end,
    },
}

