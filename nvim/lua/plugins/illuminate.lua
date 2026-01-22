return {
	{
		"RRethy/vim-illuminate",
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			providers = { "lsp", "treesitter", "regex" },
			delay = 120,
			filetypes_denylist = {
				"NvimTree",
				"alpha",
				"lazy",
				"mason",
				"toggleterm",
				"qf",
				"help",
			},
			under_cursor = true,
			large_file_cutoff = 2000,
			min_count_to_highlight = 2,
		},
		config = function(_, opts)
			require("illuminate").configure(opts)
		end,
	},
}
