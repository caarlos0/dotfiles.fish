#!/usr/bin/env fish
abbr -a less 'less -r'
if command -qs exa
	abbr -a l 'exa -lh --icons'
	abbr -a ll 'exa -l --icons'
	abbr -a lt 'exa -l --icons --tree --level=2'
	set -Ux EXA_COLORS "da=1;36"
else
	abbr -a l 'ls -lAh'
	abbr -a ll 'ls -l'
end
