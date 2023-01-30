#!/usr/bin/env fish
if not command -qs nvim
    exit
end

alias --save e='nvim'
alias --save v='nvim'
alias --save vim='nvim'

if command -qs cargo
    cargo install tree-sitter-cli &>/dev/null
end

# update plugins
nvim --headless "+Lazy! sync" +qa &>/dev/null
