#!/usr/bin/env fish
source $DOTFILES/script/common.fish

fish_add_path -a $HOME/.cargo/bin
    or info "already appended to fish_user_paths"
