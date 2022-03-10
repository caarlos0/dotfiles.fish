vim.cmd([[
fun! TrimWhitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun

augroup _general_settings
  autocmd!
  autocmd TextYankPost * lua vim.highlight.on_yank {higroup="IncSearch", timeout=150, on_visual=true}
  autocmd BufWritePre * :call TrimWhitespace()
  autocmd BufWritePre * call mkdir(expand("<afile>:p:h"), "p")
augroup END

augroup _git
  autocmd!
  autocmd FileType NeogitCommitMessage setlocal wrap
  autocmd FileType NeogitCommitMessage setlocal spell
augroup END

augroup _markdown
  autocmd!
  autocmd FileType markdown setlocal wrap
  autocmd FileType markdown setlocal spell
augroup END
]])
