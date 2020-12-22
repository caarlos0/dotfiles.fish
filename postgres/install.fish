#!/usr/bin/env fish
if ! test -e ~/.psqlrc.local
	touch ~/.psqlrc.local
end
if test -e "/Applications/Postgres.app"
	set -Ua fish_user_paths /Applications/Postgres.app/Contents/Versions/latest/bin/
end
