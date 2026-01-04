-- ==============================
-- plugins/init.lua
-- Plugin entry point
-- ==============================

return {
  require("plugins.themes"), -- must be first
  require("plugins.completion"),
  require("plugins.lsp-config"),
  require("plugins.lualine"),
  require("plugins.neo-tree"),
  require("plugins.none-ls"),
  require("plugins.telescope"),
  require("plugins.treesitter"),
  require("plugins.tailwind-tools"),
}
