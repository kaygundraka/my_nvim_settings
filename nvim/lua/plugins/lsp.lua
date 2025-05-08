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
					"omnisharp",
					"csharp_ls",
					"gopls",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			lspconfig.csharp_ls.setup({})
			lspconfig.omnisharp.setup({})
			lspconfig.gopls.setup({})

			keyMapper("K", vim.lsp.buf.hover) -- Shift + K
			keyMapper("gd", vim.lsp.buf.definition) -- Go To Definition
			keyMapper("gr", vim.lsp.buf.references) -- Find References
			keyMapper("<leader>ca", vim.lsp.buf.code_action)
		end,
	},
	{
		"ray-x/lsp_signature.nvim",
		event = "LspAttach",
		opts = {
			bind = true,
			floating_window = true,
			hint_enable = true,
			handler_opt = {
				border = "rounded",
			},
		},
		config = function(_, opts)
			require("lsp_signature").on_attach(opts)
		end,
	},
}
