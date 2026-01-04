-- ==============================
-- themes.lua
-- Rose Pine colorscheme
-- ==============================

return {
  "rose-pine/neovim",
  name = "rose-pine",
  priority = 1000, -- load before everything else

  config = function()
    require("rose-pine").setup({
      variant = "main", -- main | moon | dawn
      dark_variant = "main",

      dim_inactive_windows = true,

      styles = {
        bold = true,
        italic = true,
        transparency = false,
      },

      -- Small targeted highlights for clarity
      highlight_groups = {
        CursorLine = { bg = "surface" },
        StatusLine = { fg = "text", bg = "surface" },
        StatusLineNC = { fg = "muted", bg = "base" },
      },
    })

    vim.cmd.colorscheme("rose-pine")
  end,
}
