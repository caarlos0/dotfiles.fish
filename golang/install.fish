#!/usr/bin/env fish

set -Ux GOPATH $PROJECTS/Go
fish_add_path -a $GOPATH/bin /usr/local/go/bin
    or echo "already appended to fish_user_paths"

if command -qs go
	go install github.com/go-delve/delve/cmd/dlv@latest
end
