#!/usr/bin/env fish
set -Ux GOPATH $PROJECTS/Go
set -Ua fish_user_paths $GOPATH/bin

if test -d /usr/local/go/bin
	set -Ua fish_user_paths /usr/local/go/bin
end

if command -qs go
	go install github.com/nametake/golangci-lint-langserver@latest
end
