#!/usr/bin/env fish
if test (uname) != Darwin
    exit
end

alias --save airport=/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport
alias --save afk='open -a /System/Library/CoreServices/ScreenSaverEngine.app'

fish_add_path -a /usr/local/sbin /opt/homebrew/bin || true
