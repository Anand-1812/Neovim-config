-- ==============================
-- neo-tree.lua
-- File explorer setup with Catppuccin integration
-- ==============================

return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    event = "VeryLazy",

    config = function()
        -- Neo-tree setup
        require("neo-tree").setup({
            close_if_last_window = true,
            popup_border_style = "rounded",

            filesystem = {
                follow_current_file = { enabled = true },
                group_empty_dirs = true,
                hijack_netrw = true,
                use_libuv_file_watcher = true,

                window = {
                    width = 30,
                    mappings = {
                        ["<C-n>"] = "open",
                    },
                },
            },

            default_component_configs = {
                container = {
                    enable_character_fade = true,
                },
                indent = {
                    indent_size = 2,
                    padding = 1,
                    with_markers = true,
                },
            },
        })

        -- Keymaps
        local opts = { noremap = true, silent = true }
        vim.keymap.set("n", "<C-t>", ":Neotree filesystem reveal left<CR>", opts)
        vim.keymap.set("n", "<C-b>", ":Neotree toggle<CR>", opts)
    end,
}

