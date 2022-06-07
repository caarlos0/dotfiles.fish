#!/usr/bin/env fish
if ! command -qs tmux
	exit
end

test -d ~/.tmux/plugins/tpm || git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
curl -sL https://raw.githubusercontent.com/folke/tokyonight.nvim/main/extras/tmux_tokyonight_night.tmux -o $DOTFILES/tmux/tokyonight.tmux
