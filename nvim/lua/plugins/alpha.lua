return {
	{
		"goolord/alpha-nvim",
		event = "VimEnter",
		opts = function()
			local dashboard = require("alpha.themes.dashboard")
			return {
				layout = dashboard.config.layout,
				opts = dashboard.config.opts,
			}
		end,
		config = function(_, opts)
			require("alpha").setup(opts)
		end,
	},
}
