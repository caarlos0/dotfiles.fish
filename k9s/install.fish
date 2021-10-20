#!/usr/bin/env fish
if command -qs k9s
	switch (uname)
	case Darwin
		mkdir -p ~/Library/Preferences/k9s
		curl -sL https://raw.githubusercontent.com/derailed/k9s/master/skins/dracula.yml -o ~/Library/Preferences/k9s/skin.yml
	case Linux
		mkdir -p $XDG_CONFIG_HOME/k9s
		curl -sL https://raw.githubusercontent.com/derailed/k9s/master/skins/dracula.yml -o $XDG_CONFIG_HOME/k9s/skin.yml
	end
end
