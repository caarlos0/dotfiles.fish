set -g pure_symbol_prompt λ
set -g pure_threshold_command_duration 1

set -x EDITOR vim
set -x VEDITOR code

set -x DOTFILES ~/.dotfiles
set -x PROJECTS ~/Code
set -x GOPATH $PROJECTS/Go
set PATH $PATH $GOPATH/bin

set -x MAVEN_OPTS -Xmx1024m

set PATH $HOME/.krew/bin $PATH

set PATH $PATH $DOTFILES/bin $HOME/.bin

for f in $DOTFILES/fish/conf.d/*.fish
	source $f
end

if test -f ~/.localrc.fish
	source ~/.localrc.fish
end
