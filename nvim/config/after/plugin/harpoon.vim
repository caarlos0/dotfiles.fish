lua require("telescope").load_extension("harpoon")

nnoremap <leader>trm :lua require("harpoon.term").gotoTerminal(1)<CR>i
nnoremap <leader>mf :lua require("harpoon.mark").add_file()<CR>
nnoremap <leader>hh <cmd>Telescope harpoon marks<CR>
