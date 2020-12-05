#!/usr/bin/env fish
abbr -a airport /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport
abbr -a afk 'open -a /System/Library/CoreServices/ScreenSaverEngine.app'

sudo mkdir -p /usr/local/sbin
sudo chown -R (whoami) /usr/local/sbin
set -U fish_user_paths /usr/local/sbin $fish_user_paths
