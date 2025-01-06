return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",

    config = function()
        local config = require("nvim-treesitter.configs")
        
        -- Treesitter configuration setup
        config.setup({
            -- Automatically install missing parsers when entering buffer
            auto_install = true,

            -- Enable Treesitter-based highlighting
            highlight = {
                enable = true,  -- Enable Treesitter syntax highlighting
                additional_vim_regex_highlighting = false,  -- Disable Vim's native regex highlighting to improve performance
            },

            -- Enable Treesitter-based indentation
            indent = {
                enable = true,  -- Enable Treesitter-based indentation
            },

            -- Enable incremental selection for better navigation
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<CR>",  -- Start selection with Enter
                    node_incremental = "<TAB>",  -- Incremental selection using Tab
                    node_decremental = "<S-TAB>",  -- Decremental selection using Shift+Tab
                    scope_incremental = "<C-space>",  -- Incremental scope selection with Ctrl+Space
                },
            },

            -- Install additional language parsers
            ensure_installed = {
                "python", "javascript", "lua", "go", "rust", "cpp", "html", "css", "typescript", "json", "yaml", "toml", "bash", "markdown", "gitcommit", "ruby"
            },
        })
    end
}

