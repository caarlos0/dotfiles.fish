vim.cmd([[
set background=dark
set termguicolors
try
  packadd! dracula_pro
  let g:dracula_colorterm = 0
  colorscheme dracula_pro
catch
  try
    colorscheme dracula
  catch
    colorscheme default
  endtry
endtry
]])
