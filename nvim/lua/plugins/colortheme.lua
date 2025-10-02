-- Nord --
return {
  'shaunsingh/nord.nvim',
  lazy = false,    -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    -- Example config in lua
    vim.g.nord_contrast = true                   -- Make sidebars and popup menus like nvim-tree and telescope have a different background
    vim.g.nord_borders = false                   -- Enable the border between verticaly split windows visable
    vim.g.nord_disable_background = true         -- Disable the setting of background color so that NeoVim can use your terminal background
    vim.g.set_cursorline_transparent = false     -- Set the cursorline transparent/visible
    vim.g.nord_italic = false                    -- enables/disables italics
    vim.g.nord_enable_sidebar_background = false -- Re-enables the background of the sidebar if you disabled the background of everything
    vim.g.nord_uniform_diff_background = true    -- enables/disables colorful backgrounds when used in diff mode
    vim.g.nord_bold = false                      -- enables/disables bold

    -- Load the colorscheme
    require('nord').set()

    -- Function to set menu borders to transparent
    -- local set_menu_border_transparency = function()
    --   vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'NONE', fg = 'NONE' })
    --   vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'NONE', fg = 'NONE' })
    -- end

    -- Execute the function once after loading the colorscheme
    -- set_menu_border_transparency()

    local bg_transparent = true

    -- Toggle background transparency
    local toggle_transparency = function()
      bg_transparent = not bg_transparent
      vim.g.nord_disable_background = bg_transparent
      vim.cmd [[colorscheme nord]]
      -- set_menu_border_transparency()
    end

    vim.keymap.set('n', '<leader>bg', toggle_transparency, { noremap = true, silent = true })
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
