let mapleader=" "
nnoremap <leader>ev :vsplit ~/.config/nvim/init.vim<cr>
nnoremap <leader>sv :source ~/.config/nvim/init.vim<cr>
nnoremap <leader>ww :write<cr>
nnoremap <leader>qq :quit<cr>
nnoremap <leader>wq :wq<cr>

" keep more or less in the same place when going next
nnoremap n nzzzv
nnoremap N Nzzzv
" nnoremap J mzJ`z

" in insert mode, adds new undo points after , . ! and ?.
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

" move lines up and down
vnoremap J :m '>+1<cr>gv=gv
vnoremap K :m '<-2<cr>gv=gv
inoremap <c-j> <esc>:m .+1<cr>==
inoremap <c-k> <esc>:m .-2<cr>==
nnoremap <leader>j :m .+1<cr>==
nnoremap <leader>k :m .-2<cr>==

" jumplist mutations
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

" terminal
" nnoremap <leader>trm :terminal<cr>i
