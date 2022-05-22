#!/usr/bin/env fish
set -Ux EDITOR nvim
set -Ux VISUAL $EDITOR

set -Ux DOTFILES ~/.dotfiles
set -Ux PROJECTS ~/Developer

fish_add_path -a $DOTFILES/bin $HOME/.bin

for f in $DOTFILES/*/functions
	set -Up fish_function_path $f
end

for f in $DOTFILES/*/conf.d/*.fish
	ln -sf $f ~/.config/fish/conf.d/(basename $f)
end

if test -f ~/.localrc.fish
	ln -sf ~/.localrc.fish ~/.config/fish/conf.d/localrc.fish
end
