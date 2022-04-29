#!/usr/bin/env fish
if ! command -qs tmux
	exit
end

curl -sL https://raw.githubusercontent.com/catppuccin/tmux/main/catppuccin.conf -o $DOTFILES/tmux/catppuccin.conf
test -d ~/.tmux/plugins/tpm || git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
