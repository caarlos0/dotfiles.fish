#!/usr/bin/env fish
if test (uname) != Darwin
	exit
end

open -a Terminal.app "$DOTFILES/terminal/pragmaticivan.terminal"
defaults write com.apple.terminal "Default Window Settings" -string "pragmaticivan"
defaults write com.apple.terminal "Startup Window Settings" -string "pragmaticivan"
