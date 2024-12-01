local keyMapper = require("utils.keyMapper").mapKey

return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
				PATH = "prepend",
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"csharp_ls",
					"harper_ls",
					"clangd",
					"rust_analyzer",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({})
			lspconfig.csharp_ls.setup({})
			lspconfig.harper_ls.setup({})
			lspconfig.clangd.setup({})
			lspconfig.rust_analyzer.setup({})

			keyMapper("K", vim.lsp.buf.hover) -- Shift + K
			keyMapper("gd", vim.lsp.buf.definition) -- Go To Definition
			keyMapper("<leader>ca", vim.lsp.buf.code_action)
		end,
	},
}
