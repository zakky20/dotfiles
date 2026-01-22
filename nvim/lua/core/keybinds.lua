-- Space Bar As Leader Key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- For Conciseness
local opts = { noremap = true, silent = true }

-- Change Directory With Space+CD
vim.keymap.set("n", "<leader>cd", vim.cmd.Ex)

-- Don't Copy Word When Pressing the X Key
vim.keymap.set("n", "x", '"_x', opts)

-- Navigate Buffers Easier
vim.keymap.set("n", "<Tab>", ":bnext<CR>", opts)
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", opts)
vim.keymap.set("n", "<leader>x", ":bdelete!<CR>", opts)
vim.keymap.set("n", "<leader>b", ":<cmd> enew <CR>", opts)
