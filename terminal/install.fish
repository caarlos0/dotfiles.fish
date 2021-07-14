#!/usr/bin/env fish
if test (uname) != Darwin
	exit
end

open -a Terminal.app "$DOTFILES/terminal/Becker.terminal"
defaults write com.apple.terminal "Default Window Settings" -string "Becker"
defaults write com.apple.terminal "Startup Window Settings" -string "Becker"
