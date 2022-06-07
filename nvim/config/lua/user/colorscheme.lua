vim.g.tokyonight_style = "night"
vim.g.tokyonight_italic_functions = 1

vim.cmd([[
set background=dark
set termguicolors
try
    colorscheme tokyonight
catch
endtry
]])
