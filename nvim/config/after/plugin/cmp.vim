if !exists('g:loaded_cmp') | finish | endif
set completeopt=menu,menuone,noselect
lua require("rc.cmp")
