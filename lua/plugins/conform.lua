return {
	{
		"stevearc/conform.nvim",
		opts = {},
		enabled = true,
		config = function()
			require("conform").setup({
				format_on_save = {
					-- These options will be passed to conform.format()
					timeout_ms = 500,
					lsp_fallback = true,
				},
				formatters_by_ft = {
					lua = { "stylua" },
					-- Conform will run multiple formatters sequentially
					python = { "isort", "black" },
					-- Use a sub-list to run only the first available formatter
					javascript = { "prettierd", "prettier" },
					typescriptreact = { "prettierd", "prettier" },
					typescript = { "prettierd", "prettier" },
					-- Use the "*" filetype to run formatters on all filetypes.
					-- ["*"] = { "codespell" },
				},
			})
		end,
	},
}
