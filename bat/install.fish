#!/usr/bin/env fish
if command -qa bat
	abbr -a cat 'bat'
	set -Ux MANPAGER "sh -c 'col -bx | bat -l man -p'"
end
