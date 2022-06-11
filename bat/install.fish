#!/usr/bin/env fish
if command -qa bat
	alias --save cat=bat
	set -Ux MANPAGER "sh -c 'col -bx | bat -l man -p'"
end

if command -qa batcat
	alias --save cat=batcat
	set -Ux MANPAGER "sh -c 'col -bx | batcat -l man -p'"
end
