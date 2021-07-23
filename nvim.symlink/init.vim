call plug#begin(stdpath('data') . '/plugged')

" theme
Plug 'dracula/vim', {'as': 'dracula'}

" telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'


" lsp
Plug 'neovim/nvim-lspconfig'

call plug#end()




let mapleader=","           " The <leader> key
set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching brackets.
set ignorecase              " case insensitive matching
set mouse=v                 " middle-click paste with mouse
set hlsearch                " highlight search results
set tabstop=4               " number of columns occupied by a tab character
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set cc=80                   " set an 80 column border for good coding style
set termguicolors           " set term gui colors
set autoread                " auto reload files on changes

" Backup
"execute "set directory=" . g:vim_home_path . "/swap"
"execute "set backupdir=" . g:vim_home_path . "/backup"
"execute "set undodir="   . g:vim_home_path . "/undo"
set backup
set undofile
set writebackup

" Search settings
set hlsearch    " highlight results
set ignorecase  " ignore case
set incsearch   " show results while typing
set smartcase   " smart case sentiviness

" Tab settings
set expandtab      " expand tabs to the proper size
set tabstop=4      " tabs witdth in spaces
set softtabstop=4  " soft tab width
set shiftwidth=4   " amount of spaces when shifting

" Tab completion settings
set wildmode=list:longest     " Wildcard matches show a list, matching the longest first
set wildignore+=.git,.hg,.svn " Ignore version control repos
set wildignore+=*.6           " Ignore Go compiled files
set wildignore+=*.pyc         " Ignore Python compiled files
set wildignore+=*.rbc         " Ignore Rubinius compiled files
set wildignore+=*.swp         " Ignore vim backups






filetype plugin indent on   " allows auto-indenting depending on file type
syntax on                   " syntax highlighting
colorscheme dracula         " dracula theme


" Find files using Telescope command-line sugar.
nnoremap <leader>p <cmd>Telescope find_files<cr>
nnoremap <leader>g <cmd>Telescope live_grep<cr>
"nnoremap <leader>fb <cmd>Telescope buffers<cr>
"nnoremap <leader>fh <cmd>Telescope help_tags<cr>

lua << EOF
require'lspconfig'.gopls.setup{}
require'lspconfig'.terraformls.setup{}
EOF
