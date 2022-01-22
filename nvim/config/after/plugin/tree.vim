lua <<EOF
require'nvim-tree'.setup {
  view = {
    side = 'right'
  }
}
EOF

let g:nvim_tree_quit_on_open = 1
nnoremap <leader>tt :NvimTreeToggle<CR>
nnoremap <leader>tf :NvimTreeFindFile<CR>
