#!/usr/bin/env fish
curl -sfLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim +'PlugUpdate | PlugInstall --sync' +qa

ln -sf (which nvim) (which vim) or
	sudo ln -sf (which nvim) (which vim)
