return {
	{
		"stevearc/conform.nvim",
		event = "BufWritePre",

		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				nix = { "alejandra" },
				python = { "ruff", "ruff_format" },
				go = { "gofmt" },
				javascript = { "prettierd", "prettier" },
				html = { "prettier" },
				zig = { "zigfmt" },
				c = { "clang-format" },
				cpp = { "clang-format" },
			},

			format_on_save = {
				lsp_fallback = false,
				timeout_ms = 500,
			},

			stop_after_first = true,
		},

		config = function(_, opts)
			require("conform").setup(opts)
		end,
	},
}
