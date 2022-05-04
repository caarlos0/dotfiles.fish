#!/usr/bin/env fish
source $DOTFILES/script/common.fish

if ! test -e ~/.psqlrc.local
	touch ~/.psqlrc.local
end
if test -e "/Applications/Postgres.app"
	fish_add_path -a /Applications/Postgres.app/Contents/Versions/latest/bin/
  	    or info "already appended to fish_user_paths"
end
