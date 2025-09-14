-- ==============================
-- telescope.lua
-- Fuzzy finder setup with telescope and ui-select
-- ==============================

return {
    -- Telescope core
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = { "nvim-lua/plenary.nvim" },

        config = function()
            local telescope = require("telescope")
            local builtin = require("telescope.builtin")

            telescope.setup({
                defaults = {
                    layout_strategy = "flex",
                    layout_config = {
                        horizontal = { preview_width = 0.6 },
                        vertical = { preview_height = 0.5 },
                    },
                    sorting_strategy = "ascending",
                    winblend = 10,
                    prompt_prefix = " ",
                    selection_caret = " ",
                },
            })

            -- Keymaps
            local opts = { noremap = true, silent = true }
            vim.keymap.set("n", "<C-p>", builtin.find_files, vim.tbl_extend("force", opts, { desc = "Find files" }))
            vim.keymap.set("n", "<leader>fg", builtin.live_grep, vim.tbl_extend("force", opts, { desc = "Live grep" }))
            vim.keymap.set("n", "<leader>fb", builtin.buffers, vim.tbl_extend("force", opts, { desc = "Find buffers" }))
            vim.keymap.set("n", "<leader>fh", builtin.help_tags, vim.tbl_extend("force", opts, { desc = "Help tags" }))
            vim.keymap.set("n", "<leader>fr", builtin.resume, vim.tbl_extend("force", opts, { desc = "Resume search" }))
        end,
    },

    -- Telescope UI select extension
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = require("telescope.themes").get_dropdown({
                        previewer = false,
                    }),
                },
            })
            require("telescope").load_extension("ui-select")
        end,
    },
}

