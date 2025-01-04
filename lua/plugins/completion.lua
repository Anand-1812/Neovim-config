return {
    -- nvim-cmp LSP completion
    {
        "hrsh7th/cmp-nvim-lsp",
    },
    
    -- LuaSnip and friendly snippets
    {
        "L3MON4D3/LuaSnip",
        dependencies = {
            "saadparwaiz1/cmp_luasnip",        -- Snippet support for nvim-cmp
            "rafamadriz/friendly-snippets",     -- Collection of pre-defined snippets
        },
        config = function()
            -- Lazy load VSCode snippets
            require("luasnip.loaders.from_vscode").lazy_load()
        end,
    },
    
    -- nvim-cmp
    {
        "hrsh7th/nvim-cmp",
        config = function()
            local cmp = require("cmp")
            
            -- Setup nvim-cmp
            cmp.setup({
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),    -- Scroll documentation up
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),     -- Scroll documentation down
                    ["<C-Space>"] = cmp.mapping.complete(),     -- Trigger completion manually
                    ["<C-e>"] = cmp.mapping.abort(),            -- Close completion menu
                    ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Confirm selection
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },     -- LSP completion source
                    { name = "luasnip" },      -- LuaSnip source for snippets
                }, {
                    { name = "buffer" },       -- Buffer completion
                }),
            })
        end,
    },

    -- LSP Config (ensure LSP servers are set up correctly)
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require('lspconfig')
            -- You can configure multiple LSP servers here, for example:
            lspconfig.pyright.setup({})
            lspconfig.tsserver.setup({})
            -- Add more LSP servers as needed
        end,
    },
}

