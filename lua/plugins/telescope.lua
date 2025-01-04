return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            local builtin = require("telescope.builtin")
            
            -- Keymaps for commonly used commands
            vim.keymap.set('n', '<C-p>', builtin.find_files, { desc = 'Find files' })
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Live grep' })
            vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Find buffers' })
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Find help tags' })
            vim.keymap.set('n', '<leader>fr', builtin.resume, { desc = 'Resume last search' })
        end
    },
    {
        'nvim-telescope/telescope-ui-select.nvim',
        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        -- Using dropdown theme for the UI select extension
                        require("telescope.themes").get_dropdown({
                            -- Additional customizations (optional)
                            previewer = false,  -- Disable previewer for UI Select (optional)
                        })
                    }
                }
            })
            require("telescope").load_extension("ui-select")
        end
    },
}

