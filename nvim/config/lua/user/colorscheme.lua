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
  " highlights current line number
  highlight! CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE

  " fixes lsp referecens on dracula-pro
  highlight! link LspReferenceText DraculaSelection
  highlight! link LspReferenceRead DraculaSelection
  highlight! link LspReferenceWrite DraculaSelection

  " Highlights cmp stuff
  highlight! link CmpItemKind DraculaPurple
  highlight! link CmpItemKindMethod DraculaOrange
  highlight! link CmpItemKindFunction DraculaOrange
  highlight! link CmpItemKindVariable DraculaGreen
  highlight! link CmpItemKindField DraculaGreen
  highlight! link CmpItemKindProperty DraculaGreen
  highlight! link CmpItemKindText DraculaComment
  highlight! link CmpItemKindSnippet DraculaRed
  " highlight! link CmpItemAbbr DraculaComment
  highlight! link CmpItemAbbrMatch DraculaCyan
  highlight! link CmpItemAbbrMatchFuzzy DraculaCyan
  highlight! link CmpItemAbbrDeprecated DraculaWarnLine
  highlight! link CmpItemMenu DraculaComment

  " highlights fidget stuff
  highlight! link FidgetTitle DraculaGreen
  highlight! link FidgetTask DraculaComment
  set cursorline
endtry
]])
