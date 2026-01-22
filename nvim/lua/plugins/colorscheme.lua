return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.tokyonight_style = "night"
			vim.g.tokyonight_transparent = true
			vim.g.tokyonight_transparent_sidebar = true
			vim.g.tokyonight_italic_comments = false
			vim.g.tokyonight_italic_keywords = false
			vim.g.tokyonight_italic_functions = false
			vim.g.tokyonight_italic_variables = false
			vim.g.tokyonight_sidebars = { "NvimTree", "packer", "help" }

			vim.cmd([[colorscheme tokyonight]])

			local hl = vim.api.nvim_set_hl
			hl(0, "Normal", { bg = "NONE" })
			hl(0, "NormalNC", { bg = "NONE" })
			hl(0, "NormalFloat", { bg = "NONE" })
			hl(0, "FloatBorder", { bg = "NONE" })
			hl(0, "VertSplit", { bg = "NONE" })
			hl(0, "StatusLine", { bg = "NONE" })
			hl(0, "StatusLineNC", { bg = "NONE" })
			hl(0, "TabLine", { bg = "NONE" })
			hl(0, "TabLineSel", { bg = "NONE" })
			hl(0, "TabLineFill", { bg = "NONE" })
			hl(0, "SignColumn", { bg = "NONE" })
			hl(0, "Folded", { bg = "NONE" })
			hl(0, "MsgArea", { bg = "NONE" })

			local bg_transparent = true
			local toggle_transparency = function()
				bg_transparent = not bg_transparent
				vim.g.tokyonight_transparent = bg_transparent
				vim.g.tokyonight_transparent_sidebar = bg_transparent
				vim.cmd([[colorscheme tokyonight]])

				hl(0, "Normal", { bg = "NONE" })
				hl(0, "NormalNC", { bg = "NONE" })
				hl(0, "NormalFloat", { bg = "NONE" })
				hl(0, "FloatBorder", { bg = "NONE" })
				hl(0, "VertSplit", { bg = "NONE" })
				hl(0, "StatusLine", { bg = "NONE" })
				hl(0, "StatusLineNC", { bg = "NONE" })
				hl(0, "TabLine", { bg = "NONE" })
				hl(0, "TabLineSel", { bg = "NONE" })
				hl(0, "TabLineFill", { bg = "NONE" })
				hl(0, "CursorLine", { bg = "NONE" })
				hl(0, "SignColumn", { bg = "NONE" })
				hl(0, "Folded", { bg = "NONE" })
				hl(0, "MsgArea", { bg = "NONE" })
			end
			vim.keymap.set("n", "<leader>bg", toggle_transparency, { noremap = true, silent = true })
		end,
	},
}
