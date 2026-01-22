return {

	-- Better Copying/Yanking
	{
		"ojroques/vim-oscyank",
	},

	-- Git Plugin
	{
		"tpope/vim-fugitive",
	},

	-- Show CSS Colors
	{
		"brenoprata10/nvim-highlight-colors",
		config = function()
			require("nvim-highlight-colors").setup({})
		end,
	},

	-- Better Comments
	{
		"terrortylor/nvim-comment",
	},
}
