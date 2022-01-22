" vim:set ft=vim et sw=2:

try
  source plugs.vim
  source maps.vim
catch
  " shrug
endtry 

set hidden
set number
set relativenumber
set mouse=a
set inccommand=split
set conceallevel=0
set autoindent
set backspace=indent,eol,start
set smarttab
set complete-=i
set incsearch
set ruler
set wildmenu
set autoread
syntax enable


augroup Mkdir
  autocmd!
  autocmd BufWritePre * call mkdir(expand("<afile>:p:h"), "p")
augroup END

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" UI
set termguicolors     
set background=dark
let ayucolor="mirage" 
colorscheme ayu

