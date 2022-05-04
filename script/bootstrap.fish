#!/usr/bin/env fish
#
# bootstrap installs things.

set DOTFILES_ROOT (pwd -P)
source $DOTFILES_ROOT/script/common.fish

function setup_gitconfig
	set managed (git config --global --get dotfiles.managed)
	# if there is no user.email, we'll assume it's a new machine/setup and ask it
	if test -z (git config --global --get user.email)
		user 'What is your github author name?'
		read user_name
		user 'What is your github author email?'
		read user_email

		test -n $user_name
			or info "please inform the git author name"
		test -n $user_email
			or abort "please inform the git author email"

		git config --global user.name $user_name
			and git config --global user.email $user_email
			or abort 'failed to setup git user name and email'
	else if test '$managed' = "true"
		# if user.email exists, let's check for dotfiles.managed config. If it is
		# not true, we'll backup the gitconfig file and set previous user.email and
		# user.name in the new one
		set user_name (git config --global --get user.name)
			and set user_email (git config --global --get user.email)
			and mv ~/.gitconfig ~/.gitconfig.backup
			and git config --global user.name $user_name
			and git config --global user.email $user_email
			and success "moved ~/.gitconfig to ~/.gitconfig.backup"
			or abort 'failed to setup git user name and email'
	else
		# otherwise this gitconfig was already made by the dotfiles
		info "already managed by dotfiles"
	end
	# include the gitconfig.local file
	# finally make git knows this is a managed config already, preventing later
	# overrides by this script
	git config --global include.path ~/.gitconfig.local
		and git config --global dotfiles.managed true
		or abort 'failed to setup git'
end

function link_file -d "links a file keeping a backup"
	echo $argv | read -l old new backup
	if test -e $new
		set newf (readlink $new)
		if test "$newf" = "$old"
			success "skipped $old"
			return
		else
			mv $new $new.$backup
				and success moved $new to $new.$backup
				or abort "failed to backup $new to $new.$backup"
		end
	end
	mkdir -p (dirname $new)
		and ln -sf $old $new
		and success "linked $old to $new"
		or abort "could not link $old to $new"
end

function install_dotfiles
	for src in $DOTFILES_ROOT/*/*.symlink
		link_file $src $HOME/.(basename $src .symlink) backup
			or abort 'failed to link config file'
	end

	link_file $DOTFILES_ROOT/fisher/plugins $__fish_config_dir/fish_plugins backup
		or abort plugins
	link_file $DOTFILES_ROOT/bat/config $HOME/.config/bat/config backup
		or abort bat
	link_file $DOTFILES_ROOT/htop/htoprc $HOME/.config/htop/htoprc backup
		or abort htoprc
	link_file $DOTFILES_ROOT/ssh/config.dotfiles $HOME/.ssh/config.dotfiles backup
		or abort ssh-config
	link_file $DOTFILES_ROOT/ssh/rc $HOME/.ssh/rc backup
		or abort ssh-rc
	link_file $DOTFILES_ROOT/kitty/kitty.conf $HOME/.config/kitty/kitty.conf backup
		or abort kitty
	link_file $DOTFILES_ROOT/nvim/config $HOME/.config/nvim backup
		or abort nvim
	link_file $DOTFILES_ROOT/yamllint/config $HOME/.config/yamllint/config backup
		or abort yamllint
end

curl -sL git.io/fisher | source && fisher install jorgebucaran/fisher
	and success 'fisher'
	or abort 'fisher'

setup_gitconfig
	and success 'gitconfig'
	or abort 'gitconfig'

install_dotfiles
	and success 'dotfiles'
	or abort 'dotfiles'

fisher update
	and success 'plugins'
	or abort 'plugins'

mkdir -p ~/.config/fish/completions/
	and success 'completions'
	or abort 'completions'

for installer in */install.fish
	$installer
		and success $installer
		or abort $installer
end

if grep (command -v fish) /etc/shells
	info 'fish shell is already registered to valid login shell'
else
	command -v fish | sudo tee -a /etc/shells
		and success 'added fish to /etc/shells'
		or abort 'setup /etc/shells'
	echo
end

test (which fish) = $SHELL
	and success 'dotfiles installed/updated!'
	and exit 0

chsh -s (which fish)
	and success set (fish --version) as the default shell
	or abort 'set fish as default shell'

success 'dotfiles installed/updated!'
