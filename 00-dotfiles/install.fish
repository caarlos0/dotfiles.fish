#!/usr/bin/env fish
set -Ux EDITOR vim
set -Ux VISUAL $EDITOR
set -Ux WEDITOR code

set -Ux DOTFILES ~/.dotfiles
set -Ux PROJECTS ~/Developer

ln -sf $DOTFILES/00-dotfiles/config.fish ~/.config/fish/config.fish

for f in $DOTFILES/*/functions
	set -Up fish_function_path $f
end

for f in $DOTFILES/*/conf.d/*.fish
	ln -sf $f ~/.config/fish/conf.d/(basename $f)
end

if test -f ~/.localrc.fish
	ln -sf ~/.localrc.fish ~/.config/fish/conf.d/localrc.fish
end
