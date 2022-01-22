#!/usr/bin/env fish
set -Ux GOPATH $PROJECTS/Go
set -Ua fish_user_paths $GOPATH/bin

go install github.com/psampaz/go-mod-outdated@v0.8.0

go list -u -m -json all | go-mod-outdated -style markdown -direct -update | glow --width 120 -
