#!/usr/bin/env fish
function install
	curl -Lso /tmp/inconsolata.zip https://github.com/googlefonts/Inconsolata/releases/download/v3.000/fonts_ttf.zip
		and unzip -o -j /tmp/inconsolata.zip 'fonts/ttf/*' -d $argv[1]

	curl -Lso $argv[1]/"Inconsolata Bold for Powerline.ttf"	https://github.com/powerline/fonts/raw/master/Inconsolata/Inconsolata%20Bold%20for%20Powerline.ttf
end

switch (uname)
case Darwin
	if command -qs brew
		brew tap -q homebrew/cask-fonts
			and brew cask install font-inconsolata font-inconsolata-for-powerline
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
