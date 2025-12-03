return {
	"nvim-lualine/lualine.nvim",
	config = function()
		local mode = {
			"mode",
			fmt = function(str)
				return "" .. str
			end,
		}

		local filename = {
			"filename",
			file_status = true, -- displays file status (readonly status, modified status)
			path = 0, -- 0 = just filename, 1 = relative path, 2 = absolute path
		}

		local hide_in_width = function()
			return vim.fn.winwidth(0) > 100
		end

		local diagnostics = {
			"diagnostics",
			sources = { "nvim_diagnostic" },
			sections = { "error", "warn", "info", "hint" },
			symbols = { error = " ", warn = " ", info = " ", hint = "󰌵 " },
			colored = false,
			update_in_insert = false,
			always_visible = false,
			cond = hide_in_width,
		}

		local branch = {
			"branch",
			icon = "",
		}

		local diff = {
			"diff",
			colored = false,
			symbols = { added = " ", modified = " ", removed = " " },
			cond = hide_in_width,
		}

			require("lualine").setup({
	options = {
		theme = 'auto',
		component_separators = '',
		section_separators = { left = '', right = '' },
		globalstatus = true,
	},
	sections = {
		lualine_a = { { 'mode', separator = { left = '' } } },
		lualine_b = { 'branch', 'filetype' },
		lualine_c = { 'filename' },
		lualine_x = { 'diff', 'diagnostics' },
		lualine_y = { 'progress' },
		lualine_z = { { 'location', separator = { right = '' } } },
	},
			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = { "fugitive" },
		})
	end,
}
