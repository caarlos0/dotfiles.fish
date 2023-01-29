#!/usr/bin/env fish
if not command -qs nvim
    exit
end

# update plugins
nvim --headless "+Lazy! sync" +qa &>/dev/null

alias --save e=nvim
alias --save v=nvim
alias --save vim=nvim
