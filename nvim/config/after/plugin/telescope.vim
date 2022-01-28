if !exists('g:loaded_telescope') | finish | endif

lua require('telescope').load_extension('fzf')

nnoremap <leader>ff :Telescope find_files<CR>
nnoremap <leader>fg :Telescope git_files<CR>
nnoremap <leader>of :Telescope oldfiles<CR>
nnoremap <leader>lg :Telescope live_grep<CR>
nnoremap <leader>fb :Telescope buffers<CR>
nnoremap <leader>fh :Telescope help_tags<CR>
nnoremap <leader>ft :Telescope treesitter<CR>
nnoremap <leader>fc :Telescope commands<CR>
