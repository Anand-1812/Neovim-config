return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",          -- Utility functions used by many plugins
        "nvim-tree/nvim-web-devicons",   -- File icons (optional but recommended)
        "MunifTanjim/nui.nvim",          -- UI component library
    },
    event = "VeryLazy", -- Lazy-load Neo-tree when Neovim is idle (optional for better startup time)
    config = function()
        -- Neo-tree configuration
        require("neo-tree").setup({
            close_if_last_window = true,     -- Close Neo-tree when it's the last window
            popup_border_style = "rounded",   -- Rounded borders for popups
            filesystem = {
                follow_current_file = {
                    enabled = true,           -- Enable following the current file
                },
                group_empty_dirs = true,      -- Group empty directories in the file explorer
                hijack_netrw = true,          -- Use Neo-tree as the default file explorer (overrides netrw)
                use_libuv_file_watcher = true, -- Enable libuv file watcher for better performance
                window = {
                    width = 30,                -- Adjust the width of the file explorer window
                    mappings = {
                        ["<C-n>"] = "open",    -- Custom keymap to open the file explorer
                    },
                },
            },
            default_component_configs = {
                container = {
                    enable_character_fade = true,  -- Fade icons when the container is collapsed
                },
                indent = {
                    indent_size = 2,              -- Customize the indentation size
                    padding = 1,                  -- Space before files/folders
                    with_markers = true,          -- Display indent markers
                },
            },
        })

        -- Keymap: Open Neo-tree on the left side with <C-t>
        vim.keymap.set(
            'n',
            '<C-t>',                                 -- Keybinding: Ctrl + t
            ':Neotree filesystem reveal left<CR>',    -- Open Neo-tree on the left
            { noremap = true, silent = true }        -- Non-recursive and silent
        )

        -- Keymap to toggle Neo-tree visibility with <C-b>
        vim.keymap.set(
            'n',
            '<C-b>',                                 -- Keybinding: Ctrl + b
            ':Neotree toggle<CR>',                   -- Toggle Neo-tree visibility
            { noremap = true, silent = true }
        )
    end,
}

