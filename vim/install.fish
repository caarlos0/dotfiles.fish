#!/usr/bin/env fish
curl -sfLo ~/.vim/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +'PlugUpdate | PlugInstall --sync' +qa -s

if command -q nvim
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

	mkdir -p ~/.config/nvim/
	ln -sf "$DOTFILES/vim/vimrc.symlink" ~/.config/nvim/init.vim
	nvim +'PlugUpdate | PlugInstall --sync' +qa
end
