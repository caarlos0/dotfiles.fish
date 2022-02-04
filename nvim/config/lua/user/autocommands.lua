vim.cmd([[
fun! TrimWhitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun

augroup _general_settings
  autocmd!
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

augroup tmux
  autocmd!
  if exists('$TMUX')
    autocmd BufReadPost,FileReadPost,BufNewFile,FocusGained * call system("tmux rename-window " . fnamemodify(getcwd(), ':t'))
    autocmd VimLeave,FocusLost * call system("tmux set-window-option automatic-rename")
  endif
augroup END
]])
