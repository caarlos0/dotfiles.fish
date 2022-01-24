if !exists('g:loaded_telescope') | finish | endif

lua require('telescope').load_extension('fzf')

nnoremap <leader>ff :Telescope find_files<cr>
nnoremap <leader>of :Telescope old_files<cr>
nnoremap <leader>lg :Telescope live_grep<cr>
nnoremap <leader>fb :Telescope buffers<cr>
nnoremap <leader>fh :Telescope help_tags<cr>
