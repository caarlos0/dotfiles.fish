#!/usr/bin/env fish
if test -e "/Applications/Postgres.app"
    set -a PATH /Applications/Postgres.app/Contents/Versions/latest/bin/
end
