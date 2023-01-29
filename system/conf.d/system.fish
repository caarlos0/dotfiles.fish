#!/usr/bin/env fish
abbr -a less 'less -r'

if command -qs exa
    abbr -a l 'exa -lh --icons'
    abbr -a ll 'exa -l --icons'
    abbr -a lt 'exa -l --icons --tree --level=2'
else
    abbr -a l 'ls -lAh'
    abbr -a ll 'ls -l'
end

if command -qa bat
    alias cat=bat
    set -Ux MANPAGER "sh -c 'col -bx | bat -l man -p'"
end
