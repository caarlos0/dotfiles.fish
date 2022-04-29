#!/usr/bin/env fish
ln -sf (which nvim) (which vim)
	or sudo ln -sf (which nvim) (which vim)

abbr -a v 'nvim'

nvim --headless "+PackerSync" "+quit!"

# null-ls formatting for lua
if command -qs cargo
	cargo install stylua
end
