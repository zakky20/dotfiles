---------------
--- OPTIONS ---
---------------

-- Numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Cursor
vim.opt.cursorline = true
vim.opt.guicursor = ""

-- Other
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.termguicolors = true

-- Wrap Words
vim.opt.wrap = true
vim.opt.linebreak = true

-- Enable Mouse
vim.opt.mouse = "a"

-- Autoindent
vim.opt.autoindent = true

-- Ignore And Smart Case
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Hide --INSERT-- Or --NORMAL--
vim.opt.showmode = false

-- Better Complete Experience
vim.o.completeopt = "menuone,noselect"

-- Doesn't Create The Annoying Swap File
vim.o.swapfile = false

-- Encoding
vim.o.fileencoding = "utf-8"

-- More Space For Commands
vim.o.cmdheight = 1

-- Separate Vim Plugins From Neovim
vim.opt.runtimepath:remove("/usr/share/vim/vimfiles")
