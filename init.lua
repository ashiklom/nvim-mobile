require("config.lazy")

vim.g.mapleader = " "
vim.g.maplocalleader = " m"

local N = 2
vim.opt.expandtab = true
vim.opt.tabstop = N
vim.opt.shiftwidth = N
vim.opt.softtabstop = -1
vim.opt.smarttab = true
vim.opt.wrap = false

vim.keymap.set("n", "g?", vim.diagnostic.open_float)
vim.keymap.set("n", "<Esc>", vim.cmd.nohlsearch)
