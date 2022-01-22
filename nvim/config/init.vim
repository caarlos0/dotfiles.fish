" Plugins
" https://github.com/stars/caarlos0/lists/vim-plugins
" TODO: check if plugins are loaded before using them on plugins/after/*
call plug#begin('~/.config/nvim/autoload/')
Plug 'ayu-theme/ayu-vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'

" telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" all things lsp
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'glepnir/lspsaga.nvim'

Plug 'kyazdani42/nvim-tree.lua'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'folke/trouble.nvim'
Plug 'Yggdroot/indentLine'
Plug 'dense-analysis/ale'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lualine/lualine.nvim'
call plug#end()

" basic options
set hidden
set number
set relativenumber
set mouse=a
set inccommand=split
set conceallevel=0

augroup Mkdir
  autocmd!
  autocmd BufWritePre * call mkdir(expand("<afile>:p:h"), "p")
augroup END

" remaps
let mapleader=","
nnoremap <leader>ev :vsplit ~/.config/nvim/init.vim<cr>
nnoremap <leader>sv :source ~/.config/nvim/init.vim<cr>
nnoremap <leader>w :write<cr>
nnoremap <leader>q :quit<cr>
nnoremap <leader>wq :wq<cr>
nnoremap Y y$
"nnoremap <c-p> ctrl-p
nnoremap n nzzzv
nnoremap N Nzzzv


" in insert mode, adds new undo points after , . ! and ?.
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

nnoremap <leader>xx <cmd>TroubleToggle<cr>

vnoremap J :m '>+1<cr>gv=gv
vnoremap K :m '<-2<cr>gv=gv
inoremap <c-j> <esc>:m .+1<cr>==
inoremap <c-k> <esc>:m .-2<cr>==
nnoremap <leader>j :m .+1<cr>==
nnoremap <leader>k :m .-2<cr>==

"au BufWritePost *.go !gofmt -w %
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" UI
set termguicolors     " enable true colors support
set background=dark
let ayucolor="mirage" " for mirage version of theme
colorscheme ayu

let g:indentLine_char = '⦙'
