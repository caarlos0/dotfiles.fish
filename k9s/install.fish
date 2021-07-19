#!/usr/bin/env fish
if test -d ~/.k9s
	curl -sL https://raw.githubusercontent.com/derailed/k9s/master/skins/dracula.yml -o ~/.k9s/skin.yml
end
