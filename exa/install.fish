#!/usr/bin/env fish
if command -qa exa
	abbr -a ls 'exa --git'
	abbr -a l 'exa -lah --git'
	abbr -a la 'exa -a --git'
	abbr -a ll 'exa -l --git'
	abbr -a lt 'exa -lT --git'
else
	abbr -a l 'ls -lAh'
	abbr -a la 'ls -A'
	abbr -a ll 'ls -l'
end
