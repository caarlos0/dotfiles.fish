#!/usr/bin/env fish
if test (uname) != Darwin
    exit
end

fish_add_path -a /usr/local/sbin /opt/homebrew/bin || true
