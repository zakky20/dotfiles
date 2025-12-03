return {
	{
		-- Tmux & split window navigation
		"christoomey/vim-tmux-navigator",
	},
	{
		-- Detect tabstop and shiftwidth automatically
		"tpope/vim-sleuth",
	},
	{
		-- Powerful Git integration for Vim
		"tpope/vim-fugitive",
	},
	{
		-- GitHub integration for vim-fugitive
		"tpope/vim-rhubarb",
	},
	{
		-- Hints keybinds
		"folke/which-key.nvim",
	},

	-- LaTeX Support In Neovim
         {
        "lervag/vimtex",
        ft = { "tex", "latex" },  -- se încarcă doar pentru LaTeX
        config = function()
            -- Folosește latexmk pentru compilare PDF
            vim.g.vimtex_compiler_method = 'latexmk'
            vim.g.vimtex_compiler_latexmk = {
                build_dir = '',           -- directorul de build
                continuous = 1,           -- compilare automată la salvare
                executable = 'latexmk',   -- asigură că latexmk e instalat
                options = { '-pdf', '-interaction=nonstopmode', '-synctex=1' },
            }

            -- PDF viewer: Zathura
            vim.g.vimtex_view_method = 'zathura'
            vim.g.vimtex_view_general_options = '-reuse-instance'

            -- Quickfix și notificări
            vim.g.vimtex_quickfix_mode = 0  -- nu deschide automat quickfix

            -- Mesaj după compilare (dacă ai nvim-notify)
            vim.g.vimtex_compiler_callback_enabled = 1
            vim.g.vimtex_compiler_callback = function(status)
                if status == 0 then
                    vim.notify("VimTeX: Compilation completed successfully!", vim.log.levels.INFO)
                else
                    vim.notify("VimTeX: Compilation failed!", vim.log.levels.ERROR)
                end
            end
        end,
    },
	-- Nvim Cursorline
	{
		"yamatsum/nvim-cursorline",
		event = "BufReadPost",
		config = function()
			require("nvim-cursorline").setup({
				cursorline = {
					enable = true,
					timeout = 0,
					number = false,
				},
				cursorword = {
					enable = false,
				},
			})
		end,
	},
	-- Noice Nvim
	-- {
	--   "folke/noice.nvim",
	--   event = "VeryLazy",
	--   dependencies = {
	--     "MunifTanjim/nui.nvim",
	--     "rcarriga/nvim-notify",
	--   },
	--   config = function()
	--     require("noice").setup({
	--       lsp = {
	--         override = {
	--           ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
	--           ["vim.lsp.util.stylize_markdown"] = true,
	--           ["cmp.entry.get_documentation"] = true,
	--         },
	--       },
	--       presets = {
	--         bottom_search = true,
	--         command_palette = true,
	--         long_message_to_split = true,
	--       },
	--     })
	--   end,
	-- },

	{
		-- Autoclose parentheses, brackets, quotes, etc.
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
		opts = {},
	},
	{
		-- Highlight todo, notes, etc in comments
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},
	{
		-- High-performance color highlighter
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},
}
