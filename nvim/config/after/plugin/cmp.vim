if !exists('g:loaded_cmp') | finish | endif
set completeopt=menu,menuone,noselect,noinsert
lua require("rc.cmp")
