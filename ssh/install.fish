#!/usr/bin/env fish

function ssh_config -d "links ~/.ssh config file and keep a backup"
	echo $argv | read -l p
	if not test -e ~/.ssh
		mkdir ~/.ssh
		success "A new ~/.ssh folder has been created"
	end
	test -L ~/.ssh/config || {
		mv ~/.ssh/config ~/.ssh/config.local
		ln -s $DOTFILES/ssh/config ~/.ssh/config
	}
	test -f ~/.ssh/config.local || touch ~/.ssh/config.local
end

ssh_config  ~/.ssh/config.local
