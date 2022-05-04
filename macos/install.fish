#!/usr/bin/env fish
source $DOTFILES/script/common.fish

if test (uname) != Darwin
	exit
end

abbr -a airport /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport
abbr -a afk 'open -a /System/Library/CoreServices/ScreenSaverEngine.app'

fish_add_path -a /usr/local/sbin /opt/homebrew/bin
    or info "already appended to fish_user_paths"
