#!/usr/bin/env fish
if ! command -qs tmux
	exit
end

test -d ~/.tmux/plugins/tpm || git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

abbr -a ta 'tmux-new'
