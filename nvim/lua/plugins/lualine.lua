return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },

	config = function()
		local hide_in_width = function()
			return vim.fn.winwidth(0) > 100
		end

		local mode = {
			"mode",
			separator = { left = "", right = "" },
			fmt = function(str)
				if hide_in_width() then
					return " " .. str
				else
					return " " .. str:sub(1, 1)
				end
			end,
		}

		local progress = function()
			local current_line = vim.fn.line(".")
			local total_lines = vim.fn.line("$")
			local chars = { "", "", "" }
			local line_ratio = current_line / total_lines
			local index = math.ceil(line_ratio * #chars)
			return chars[index] .. " " .. math.floor(line_ratio * 100) .. "%%"
		end

		local diagnostics = {
			"diagnostics",
			sources = { "nvim_diagnostic" },
			sections = { "error", "warn" },
			symbols = { error = " ", warn = " " },
			colored = true,
			update_in_insert = false,
			always_visible = true,
			cond = function()
				return vim.bo.filetype ~= "markdown"
			end,
		}

		local diff = {
			"diff",
			colored = true,
			symbols = { added = " ", modified = " ", removed = " " },
		}

		local filename = {
			"filename",
			file_status = true,
			icon = "",
			path = 0,
		}

		local branch = {
			"branch",
			icon = "",
		}

		local location = {
			"location",
			icon = "",
		}

		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = "tokyonight",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				globalstatus = true,
			},

			sections = {
				lualine_a = { mode },
				lualine_b = { branch, "filetype" },
				lualine_c = { filename },
				lualine_x = { diff, diagnostics },
				lualine_y = { progress },
				lualine_z = {
					{
						function()
							return "󰥔 " .. os.date("%R")
						end,
						separator = { right = "", left = "" },
					},
				},
			},
		})
	end,
}
