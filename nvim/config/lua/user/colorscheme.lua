vim.g.gruvbox_contrast_dark = "hard"
-- or dark0_hard:
vim.g.gruvbox_sign_column = "NONE"

vim.cmd([[
set background=dark
set termguicolors
try
    colorscheme gruvbox
	hi Normal guibg=NONE ctermbg=NONE
catch
endtry
]])
