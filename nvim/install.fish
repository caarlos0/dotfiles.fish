#!/usr/bin/env fish
if not command -qs nvim
    exit
end

# update plugins
nvim --headless "+Lazy! sync" +qa &>/dev/null
