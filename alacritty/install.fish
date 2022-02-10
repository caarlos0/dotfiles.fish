#!/usr/bin/env fish
if test -f $DOTFILES/alacritty/dracula.yml
	exit 0
end

curl -sL https://raw.githubusercontent.com/dracula/alacritty/master/dracula.yml -o $DOTFILES/alacritty/dracula.yml
