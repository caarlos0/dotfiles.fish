#!/usr/bin/env fish
abbr -a e 'nvim'
abbr -a v 'nvim'
abbr -a vim 'nvim'

# update plugins
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync' &>/dev/null
