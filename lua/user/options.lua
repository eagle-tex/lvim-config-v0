-- vim options
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevelstart = 99
vim.opt.relativenumber = true -- set relative numbered lines
-- vim.opt.scrolloff=8
vim.opt.shiftwidth = 2 -- the number of spaces inserted for each indentation
vim.opt.tabstop = 2 -- insert 2 spaces for a tab
vim.opt.wrap = true -- wrap lines

vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
