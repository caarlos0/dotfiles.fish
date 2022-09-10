vim.g.catppuccin_flavour = "mocha"

require("catppuccin").setup()

vim.cmd([[
set background=dark
set termguicolors
colorscheme catppuccin
]])
