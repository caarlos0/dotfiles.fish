#!/usr/bin/env fish
switch (uname)
case Darwin
	if test -d $XDG_CONFIG_HOME/k9s
		curl -sL https://raw.githubusercontent.com/derailed/k9s/master/skins/dracula.yml -o ~/Library/Preferences/k9s/skin.yml
	end
case Linux
	if test -d $XDG_CONFIG_HOME/k9s
		curl -sL https://raw.githubusercontent.com/derailed/k9s/master/skins/dracula.yml -o $XDG_CONFIG_HOME/k9s/skin.yml
	end
end
