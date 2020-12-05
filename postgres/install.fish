#!/usr/bin/env fish
if ! test -e ~/.psqlrc.local
	touch ~/.psqlrc.local
end
if test -e "/Applications/Postgres.app"
    set -Ua PATH /Applications/Postgres.app/Contents/Versions/latest/bin/
end
