return {
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			-- This will be configured by mason-lspconfig
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"ts_ls",
					"pyright",
					"clangd",
					"html",
					"cssls",
					"jsonls",
					"solargraph",
				},
				automatic_installation = true,
				automatic_enable = false, -- Disable automatic enabling to avoid the error
			})

			-- Setup LSP servers after mason-lspconfig
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local servers = {
				"lua_ls",
				"ts_ls",
				"pyright",
				"clangd",
				"html",
				"cssls",
				"jsonls",
				"solargraph",
			}

			for _, server in ipairs(servers) do
				lspconfig[server].setup({
					capabilities = capabilities,
					on_attach = function(_, bufnr)
						local opts = { buffer = bufnr, noremap = true, silent = true }
						vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts)
						vim.keymap.set("n", "<leader>K", vim.lsp.buf.hover, opts)
						vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
						vim.keymap.set("n", "<leader>f", function()
							vim.lsp.buf.format({ async = true })
						end, opts)
					end,
				})
			end
		end,
	},
}
