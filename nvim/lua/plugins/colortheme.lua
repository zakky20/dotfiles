-- Nord --
return {
  "arcticicestudio/nord-vim",
  priority = 1000,
  config = function()
    vim.g.nord_contrast = true
    vim.g.nord_borders = true
    vim.g.nord_disable_background = false
    vim.g.nord_italic = true
    vim.cmd.colorscheme("nord")
  end,
}

-- Solarized --
-- return {
--   "maxmx03/solarized.nvim",
--   priority = 1000,
--   config = function()
--     vim.o.background = "dark" -- or "light"
--     vim.cmd.colorscheme("solarized")
--   end,
-- }

-- Kanagawa --
-- return {
--   "rebelot/kanagawa.nvim",
--   priority = 1000,
--   config = function()
--     vim.o.background = "dark" -- Kanagawa is mainly dark, but has variants
--     vim.cmd.colorscheme("kanagawa")
--   end,
-- }

-- Dracula --
-- return {
-- 	"Mofiqul/dracula.nvim",
-- 	priority = 1000,
-- 	config = function()
-- 		require("dracula").setup({
-- 			italic_comment = true,
-- 		})
-- 		vim.cmd.colorscheme("dracula")
-- 	end,
-- }

-- Gruvbox --
-- return {
-- 	"sainnhe/gruvbox-material",
-- 	priority = 1000,
-- 	config = function()
-- 		vim.g.gruvbox_material_enable_italic = true
-- 		vim.cmd.colorscheme("gruvbox-material")
-- 	end,
-- }

-- Everforest --
-- return {
-- 	"neanias/everforest-nvim",
-- 	priority = 1000,
-- 	config = function()
-- 		require("everforest").setup({
-- 			background = "hard", -- options: 'hard', 'medium', 'soft'
-- 			transparent_background_level = 1, -- 0 = opaque, 1 = transparent
-- 			italics = true,
-- 			disable_italic_comments = false,
-- 			sign_column_background = "none",
-- 			diagnostic_text_highlight = true,
-- 			diagnostic_line_highlight = false,
-- 			diagnostic_virtual_text = "colored",
-- 		})
-- 		vim.cmd.colorscheme("everforest")
-- 	end,
-- }

-- One Dark --
-- return {
-- 	"navarasu/onedark.nvim",
-- 	priority = 1000,
-- 	config = function()
-- 		require("onedark").setup({
-- 			style = "dark", -- options: dark, darker, cool, deep, warm, warmer
-- 			transparent = true,
-- 			code_style = {
-- 				comments = "italic",
-- 				keywords = "none",
-- 				functions = "none",
-- 				variables = "none",
-- 			},
-- 			diagnostics = {
-- 				darker = true,
-- 				undercurl = true,
-- 				background = false,
-- 			},
-- 		})
-- 		require("onedark").load()
-- 	end,
-- }

-- Decay --
-- return {
-- 	"decaycs/decay.nvim",
-- 	priority = 1000,
-- 	config = function()
-- 		require("decay").setup({
-- 			style = "dark-decay", -- options: "decay", "decayce", "dark-decay", "dark-decayce"
-- 			transparent = true,
-- 			italic_comments = true,
-- 			nvim_tree = { contrast = true }, -- enable nvim-tree contrast
-- 			plugins = { "all" }, -- highlight all supported plugins
-- 		})
-- 	end,
-- }

-- Rose Pine --
-- return {
--     "rose-pine/neovim",
--     priority = 1000,
--     config = function()
--         require("rose-pine").setup({
--             --- @usage 'auto'|'main'|'moon'
--             variant = "main",
--             --- @usage 'main'|'moon'|'dawn'
--             dark_variant = "main",
--             --- disable background (useful for transparency)
--             disable_background = true,
--             --- highlight styles
--             groups = {
--                 comment = "italic",
--                 keyword = "none",
--                 function_ = "none",
--                 variable = "none",
--             },
--             --- diagnostics style
--             diagnostics = {
--                 darker = true,
--                 undercurl = true,
--                 background = false,
--             },
--         })
--         vim.cmd("colorscheme rose-pine")
--     end,
-- }

-- Tokyo Night --
-- return {
-- 	"folke/tokyonight.nvim",
-- 	priority = 1000,
-- 	config = function()
-- 		require("tokyonight").setup({
-- 			style = "storm",
-- 			transparent = true,
-- 			styles = {
-- 				sidebars = "dark",
-- 				floats = "dark",
-- 				comments = { italic = true },
-- 				keywords = { italic = false },
-- 				functions = {},
-- 				variables = {},
-- 			},
-- 			dim_inactive = true,
-- 		})
-- 		vim.cmd.colorscheme("tokyonight")
-- 	end,
-- }
