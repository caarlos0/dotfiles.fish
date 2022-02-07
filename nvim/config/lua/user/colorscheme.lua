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

try
  " fixes lsp referecens on dracula-pro
  hi! link LspReferenceText DraculaSelection
  hi! link LspReferenceRead DraculaSelection
  hi! link LspReferenceWrite DraculaSelection
  " highlights current line number
  highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
  set cursorline
endtry
]])
