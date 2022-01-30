lua require "rc.options"
lua require 'rc.keymaps'
lua require "rc.plugins"
lua require "rc.colorscheme"
lua require "rc.toggleterm"
lua require "rc.autopairs"
lua require "rc.gitsigns"


fun! TrimWhitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun

augroup DOTFILES
  autocmd!
  autocmd BufWritePre * :call TrimWhitespace()
  autocmd BufWritePre * call mkdir(expand("<afile>:p:h"), "p")
augroup END

