------------------
--- TreeSitter ---
------------------

return {
	"nvim-treesitter/nvim-treesitter",
	event = "BufReadPost",
	build = ":TSUpdate",
	config = function()
		vim.filetype.add({
			pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
		})

		local ok, configs = pcall(require, "nvim-treesitter.configs")
		if not ok then
			return
		end
		configs.setup({
			highlight = { enable = true },
			indent = { enable = true },
			autotag = { enable = true },
			ensure_installed = {
				"lua",
				"cpp",
				"c",
				"vim",
				"vimdoc",
				"query",
				"markdown",
				"markdown_inline",
				"python",
				"javascript",
				"typescript",
				"bash",
				"ruby",
				"rust",
				"html",
				"css",
				"php",
				"nix",
			},
			auto_install = true,
		})
	end,
}
