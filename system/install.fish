#!/usr/bin/env fish
abbr -a less 'less -r'
if command -qs gpg-connect-agent
	alias l='exa -lh --icons'
	alias ll='exa -l --icons'
	alias lt='exa -l --icons --tree --level=2'
else
	abbr -a l 'ls -lAh'
	abbr -a ll 'ls -l'
end
