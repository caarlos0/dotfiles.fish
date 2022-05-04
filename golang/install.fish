#!/usr/bin/env fish
source $DOTFILES/script/common.fish

set -Ux GOPATH $PROJECTS/Go
fish_add_path -a $GOPATH/bin /usr/local/go/bin
    or info "already appended to fish_user_paths"

if command -qs go
	go install github.com/go-delve/delve/cmd/dlv@latest
end
