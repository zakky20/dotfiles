return {
  "lervag/vimtex",
  lazy = false,  -- load immediately
  config = function()
    vim.g.vimtex_compiler_method = "latexmk"
    vim.g.vimtex_compiler_latexmk = {
      build_dir = "",         -- optional build directory
      continuous = 1,         -- enable auto-compiling
      executable = "latexmk",
      options = {
        "-pdf",
        "-interaction=nonstopmode",
        "-synctex=1"
      }
    }

    vim.g.vimtex_view_method = "zathura"
    vim.g.vimtex_view_general_options = "-reuse-instance"
    vim.g.vimtex_fold_enabled = true
    vim.g.vimtex_syntax_conceal = true

    vim.g.mapleader = " "
    vim.api.nvim_set_keymap(
      'n',
      '<Leader>ll',
      ':VimtexCompile<CR>:VimtexView<CR>',
      { noremap = true, silent = true }
    )
  end
}
