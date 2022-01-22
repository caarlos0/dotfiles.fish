lua <<EOF
require('lspsaga').init_lsp_saga {}
EOF

nnoremap <silent> <C-j> :Lspsaga diagnostic_jump_next<CR>
nnoremap <silent> K :Lspsaga hover_doc<cr>
inoremap <silent> <C-k> :Lspsaga signature_help<cr>
nnoremap <silent> gh :Lspsaga lsp_finder<cr>
