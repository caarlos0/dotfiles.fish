#!/usr/bin/env fish
if test -e ~/.local/share/fonts/Inconsolata[wdth,wght].ttf ||
	test -e ~/Library/Fonts/Inconsolata[wdth,wght].ttf
	exit 0
end

function install
	curl -Lso $argv[1]/Inconsolata[wdth,wght].ttf https://github.com/google/fonts/raw/master/ofl/inconsolata/Inconsolata%5Bwdth%2Cwght%5D.ttf
end

switch (uname)
case Darwin
	if command -qs brew
		brew tap -q homebrew/cask-fonts
			and brew install --cask font-inconsolata
	else
		install ~/Library/Fonts
	end
case '*'
	mkdir -p ~/.local/share/fonts/
		and install ~/.local/share/fonts/
	if command -qs fc-cache
		fc-cache -fv
	end
end
