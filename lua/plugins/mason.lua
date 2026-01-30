return {
  "williamboman/mason.nvim",
  cmd = "Mason",
  build = ":MasonUpdate",
  config = function()
    require("mason").setup({
      ui = {
        border = "rounded",
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    -- Auto-install tools we care about
    local mr = require("mason-registry")

    local tools = {
      -- LSP servers
      "lua-language-server",
      "pyright",
      "clangd",
      "typescript-language-server",
      "tailwindcss-language-server",

      -- Formatters / linters (for none-ls)
      "stylua",
      "prettierd",
      "eslint_d",
      "black",
      "isort",
    }

    for _, tool in ipairs(tools) do
      local pkg = mr.get_package(tool)
      if not pkg:is_installed() then
        pkg:install()
      end
    end
  end,
}

