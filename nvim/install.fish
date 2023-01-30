#!/usr/bin/env fish
if not command -qs nvim
    exit
end

alias --save e='nvim'
alias --save v='nvim'
alias --save vim='nvim'

# update plugins
nvim --headless "+Lazy! sync" +qa &>/dev/null
