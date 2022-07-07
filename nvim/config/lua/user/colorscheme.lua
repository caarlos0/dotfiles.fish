vim.g.gruvbox_contrast_dark = "hard"
vim.g.gruvbox_sign_column = "dark0_hard"

vim.cmd([[
set background=dark
set termguicolors
try
	colorscheme gruvbox
catch
endtry
]])
