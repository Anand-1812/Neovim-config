-- ==============================
-- lsp-config.lua
-- LSP Configuration for Neovim 0.11+
-- ==============================

return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local lspconfig = require("lspconfig")
      local mason_lspconfig = require("mason-lspconfig")
      
      -- Setup Mason-LSPConfig
      mason_lspconfig.setup({
        ensure_installed = {
          "lua_ls",
          "pyright",
          "clangd",
          "gopls",
          "rust_analyzer",
          "html",
          "cssls",
          "jsonls",
          "yamlls",
          "tailwindcss",
          "ts_ls",
        },
        automatic_installation = true,
      })

      -- Get capabilities for autocompletion
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Global LSP keybindings - ONLY set if server supports the method
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          local client = vim.lsp.get_client_by_id(ev.data.client_id)
          local opts = { buffer = ev.buf, noremap = true, silent = true }
          
          -- Helper function to check if method is supported
          local function supports(method)
            return client and client.supports_method(method)
          end
          
          -- Definition (most servers support this)
          if supports("textDocument/definition") then
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, 
              vim.tbl_extend("force", opts, { desc = "Go to definition" }))
          end
          
          -- Declaration (C/C++, Go, etc.)
          if supports("textDocument/declaration") then
            vim.keymap.set("n", "gD", vim.lsp.buf.declaration, 
              vim.tbl_extend("force", opts, { desc = "Go to declaration" }))
          end
          
          -- Implementation (interfaces in TS/Go/Java)
          if supports("textDocument/implementation") then
            vim.keymap.set("n", "gi", vim.lsp.buf.implementation, 
              vim.tbl_extend("force", opts, { desc = "Go to implementation" }))
          end
          
          -- References (most servers support this)
          if supports("textDocument/references") then
            vim.keymap.set("n", "gr", vim.lsp.buf.references, 
              vim.tbl_extend("force", opts, { desc = "Show references" }))
          end
          
          -- Hover documentation (universal)
          if supports("textDocument/hover") then
            vim.keymap.set("n", "K", vim.lsp.buf.hover, 
              vim.tbl_extend("force", opts, { desc = "Hover documentation" }))
          end
          
          -- Rename (most servers support this)
          if supports("textDocument/rename") then
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, 
              vim.tbl_extend("force", opts, { desc = "Rename symbol" }))
          end
          
          -- Code actions (most servers support this)
          if supports("textDocument/codeAction") then
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, 
              vim.tbl_extend("force", opts, { desc = "Code actions" }))
          end
          
          -- Formatting (if supported by this specific server)
          if supports("textDocument/formatting") then
            vim.keymap.set("n", "<leader>f", function()
              vim.lsp.buf.format({ async = true })
            end, vim.tbl_extend("force", opts, { desc = "Format buffer" }))
          end
          
          -- Signature help (helpful for functions)
          if supports("textDocument/signatureHelp") then
            vim.keymap.set("n", "<leader>sh", vim.lsp.buf.signature_help, 
              vim.tbl_extend("force", opts, { desc = "Signature help" }))
          end
          
          -- Type definition (TypeScript, Go, etc.)
          if supports("textDocument/typeDefinition") then
            vim.keymap.set("n", "gy", vim.lsp.buf.type_definition, 
              vim.tbl_extend("force", opts, { desc = "Go to type definition" }))
          end
          
          -- Workspace symbol search
          if supports("workspace/symbol") then
            vim.keymap.set("n", "<leader>ws", vim.lsp.buf.workspace_symbol, 
              vim.tbl_extend("force", opts, { desc = "Workspace symbols" }))
          end
          
          -- Always available: manual indent (doesn't require LSP)
          vim.keymap.set("n", "<leader>i", function()
            vim.cmd("normal! gg=G")
          end, { buffer = ev.buf, desc = "Auto-indent entire file" })
          
          -- Diagnostic keymaps (always available)
          vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, 
            vim.tbl_extend("force", opts, { desc = "Previous diagnostic" }))
          vim.keymap.set("n", "]d", vim.diagnostic.goto_next, 
            vim.tbl_extend("force", opts, { desc = "Next diagnostic" }))
          vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, 
            vim.tbl_extend("force", opts, { desc = "Show diagnostic" }))
          vim.keymap.set("n", "<leader>dl", vim.diagnostic.setloclist, 
            vim.tbl_extend("force", opts, { desc = "Diagnostic list" }))
        end,
      })

      -- Default config for all servers
      local default_config = {
        capabilities = capabilities,
      }

      -- Server-specific configurations
      local server_configs = {
        lua_ls = vim.tbl_deep_extend("force", default_config, {
          settings = {
            Lua = {
              diagnostics = {
                globals = { "vim" },
              },
              workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
              },
              telemetry = { enable = false },
            },
          },
        }),
        
        tailwindcss = vim.tbl_deep_extend("force", default_config, {
          settings = {
            tailwindCSS = {
              experimental = {
                classRegex = {
                  "tw`([^`]*)",
                  'tw="([^"]*)',
                  'tw={"([^"}]*)',
                  "tw\\.\\w+`([^`]*)",
                  "tw\\(.*?\\)`([^`]*)",
                },
              },
            },
          },
        }),
        
        ts_ls = vim.tbl_deep_extend("force", default_config, {
          settings = {
            typescript = {
              inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              },
            },
          },
        }),
      }

      -- Setup each server manually
      local servers = {
        "lua_ls",
        "pyright",
        "clangd",
        "gopls",
        "rust_analyzer",
        "html",
        "cssls",
        "jsonls",
        "yamlls",
        "tailwindcss",
        "ts_ls",
      }

      for _, server_name in ipairs(servers) do
        local config = server_configs[server_name] or default_config
        lspconfig[server_name].setup(config)
      end
    end,
  },
}