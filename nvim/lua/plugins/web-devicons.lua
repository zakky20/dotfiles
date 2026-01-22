return {
	{
		"nvim-tree/nvim-web-devicons",
		lazy = true,

		opts = {
			default = true,
		},

		config = function(_, opts)
			require("nvim-web-devicons").setup(opts)
		end,
	},
}
