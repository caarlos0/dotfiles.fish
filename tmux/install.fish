#!/usr/bin/env fish
#
if ! command -qs tmux
	exit 0
end

test -d ~/.tmux/plugins/tpm || git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
