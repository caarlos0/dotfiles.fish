vim.cmd([[
fun! TrimWhitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun

augroup _general_settings
  autocmd!
  autocmd BufNewFile,BufRead *.dockerfile set ft=dockerfile
  autocmd TextYankPost * lua vim.highlight.on_yank {higroup="IncSearch", timeout=150, on_visual=true}
  autocmd BufWritePre * :call TrimWhitespace()
  autocmd BufWritePre * call mkdir(expand("<afile>:p:h"), "p")
  autocmd TextYankPost * if v:event.operator is 'y' && v:event.regname is '+' | execute 'OSCYankReg +' | endif
augroup END

augroup _git
  autocmd!
  autocmd FileType gitcommit setlocal wrap
  autocmd FileType gitcommit setlocal spell
augroup END

augroup _markdown
  autocmd!
  autocmd FileType markdown setlocal wrap
  autocmd FileType markdown setlocal spell
augroup END
]])
