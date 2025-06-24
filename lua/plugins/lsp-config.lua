return {
	-- LSP Installer
	{
		"kabouzeid/nvim-lspinstall",
		config = function()
			require("lspinstall").setup()

			local lspconfig = require("lspconfig")
			local cmp_caps = require("cmp_nvim_lsp").default_capabilities()

			local function setup_servers()
				require("lspinstall").setup()
				for _, srv in ipairs(require("lspinstall").installed_servers()) do
					lspconfig[srv].setup({
						capabilities = cmp_caps,
						on_attach = function(client, bufnr)
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
			end

			setup_servers()
			require("lspinstall").post_install_hook = function()
				setup_servers()
				vim.cmd("bufdo e")
			end
		end,
	},

	-- Completion via nvim-cmp
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-Space>"] = cmp.mapping.complete(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<C-e>"] = cmp.mapping.abort(),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
				}),
				sources = {
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "buffer" },
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
			})
		end,
	},
}
