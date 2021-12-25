#!/usr/bin/env fish
#
# bootstrap installs things.

set DOTFILES_ROOT (pwd -P)

function info
	echo [(set_color --bold) ' .. ' (set_color normal)] $argv
end

function user
	echo [(set_color --bold) ' ?? ' (set_color normal)] $argv
end

function success
	echo [(set_color --bold green) ' OK ' (set_color normal)] $argv
end

function abort
	echo [(set_color --bold yellow) ABRT (set_color normal)] $argv
	exit 1
end

function on_exit -p %self
	if not contains $argv[3] 0
		echo [(set_color --bold red) FAIL (set_color normal)] "Couldn't setup dotfiles, please open an issue at https://github.com/caarlos0/dotfiles"
	end
end

function setup_gitconfig
	set managed (git config --global --get dotfiles.managed)
	# if there is no user.email, we'll assume it's a new machine/setup and ask it
	if test -z (git config --global --get user.email)
		user 'What is your github author name?'
		read user_name
		user 'What is your github author email?'
		read user_email

		test -n $user_name
			or echo "please inform the git author name"
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
		or abort ssh
	link_file $DOTFILES_ROOT/kitty/kitty.conf $HOME/.config/kitty/kitty.conf backup
		or abort kitty
end

function setup_software
	brew bundle --file "$DOTFILES_ROOT/brewfile"
end

function setup_path_extensions
	switch (uname -p)
	case arm
		set -Up fish_user_paths /opt/homebrew/opt/gnu-getopt/bin
		set -Up fish_user_paths /opt/homebrew/opt/gnu-sed/libexec/gnubin
		set -Up fish_user_paths /opt/homebrew/opt/gnu-indent/libexec/gnubin
	case '*'
		set -Up fish_user_paths /usr/local/opt/gnu-getopt/bin
		set -Up fish_user_paths /usr/local/opt/gnu-sed/libexec/gnubin
		set -Up fish_user_paths /usr/local/opt/coreutils/libexec/gnubin
	end
end

function setup_vscode_extensions
	cat "$DOTFILES_ROOT/vscode/extensions.list" | grep -v '^#' | xargs -L1 code --install-extension
end

function setup_fish_as_default_shell
	chsh -s (which fish)
		and success set (fish --version) as the default shell
		or abort 'set fish as default shell'
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

if ! grep (command -v fish) /etc/shells
	command -v fish | sudo tee -a /etc/shells
		and success 'added fish to /etc/shells'
		or abort 'setup /etc/shells'
	echo
end

test (which fish) = $SHELL
	and success 'fish is already the default shell'
	or setup_fish_as_default_shell


setup_software
	and success 'software'
	or abort 'software'

success 'software packages installed/updated!'

setup_path_extensions
	and success 'path_extensions'
	or abort 'path_extensions'

success 'path_extensions installed/updated!'

setup_vscode_extensions
	and success 'vscode extensions'
	or abort 'vscode extensions'

success 'vscode extensions installed/updated!'

success 'dotfiles installed/updated!'