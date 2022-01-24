" vim:set ft=vim et sw=2:

try
  source ~/.config/nvim/plugs.vim
  source ~/.config/nvim/maps.vim
catch
  " shrug
endtry

" hidde buffer without saving
set hidden

" linenumber
set number
set relativenumber

" keeping history
set noswapfile
set nobackup
set undodir=~/.config/nvim/undodir
set undofile

set mouse=a
set inccommand=split

" do not hide blocks on markdown files et al
set conceallevel=0
set backspace=indent,eol,start
set complete-=i
set ruler
set wildmenu
set autoread
syntax enable

" tab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
" set autoindent

" search
set nohlsearch
set incsearch

set signcolumn=yes
set scrolloff=8
set colorcolumn=80

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

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" colorscheme
set termguicolors
set background=dark
let ayucolor="mirage"
colorscheme ayu

