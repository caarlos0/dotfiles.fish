vim.cmd([[
set background=dark
set termguicolors
try
  packadd! dracula_pro
  let g:dracula_colorterm = 0
  colorscheme dracula_pro
  " fixes lsp referecens on dracula-pro
  hi! link LspReferenceText DraculaSelection
  hi! link LspReferenceRead DraculaSelection
  hi! link LspReferenceWrite DraculaSelection
catch
  try
    colorscheme dracula
  catch
    colorscheme default
  endtry
endtry
]])
