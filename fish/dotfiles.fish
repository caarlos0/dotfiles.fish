set -x EDITOR vim
set -x VISUAL $EDITOR
set -x WEDITOR code

set -x DOTFILES ~/.dotfiles
set -x PROJECTS ~/Code

set -a PATH $DOTFILES/bin $HOME/.bin

set lucid_cwd_color blue
set lucid_git_color brblack

for f in $DOTFILES/*/functions
	set -p fish_function_path $f
end

for f in $DOTFILES/*/conf.fish
	source $f
end

if test -f ~/.localrc.fish
	source ~/.localrc.fish
end
