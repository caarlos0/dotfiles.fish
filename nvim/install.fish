#!/usr/bin/env fish
if not command -qs nvim
	exit
end

abbr -a e 'nvim'
abbr -a v 'nvim'
abbr -a vim 'nvim'

# update plugins
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync' &>/dev/null
