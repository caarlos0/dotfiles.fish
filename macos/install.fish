#!/usr/bin/env fish
if test (uname) != Darwin
	exit
end

abbr -a airport /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport
abbr -a afk 'open -a /System/Library/CoreServices/ScreenSaverEngine.app'

set -Ua fish_user_paths /usr/local/sbin /opt/homebrew/bin
