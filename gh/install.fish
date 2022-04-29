#!/usr/bin/env fish
if not command -qs gh
	exit
end

gh config set git_protocol ssh

for ext in mislav/gh-branch vilmibm/gh-user-status dlvhdr/gh-prs
	gh extension list | grep -wq $ext || gh extension install $ext
end

gh extension upgrade --all

switch (uname)
case Darwin
	mkdir -p "$HOME/Library/Application Support/prs"
	ln -sf "$DOTFILES/gh/prs.yml" "$HOME/Library/Application Support/prs/config.yml"
case Linux
	mkdir -p "$HOME/.config/prs"
	ln -sf "$DOTFILES/gh/prs.yml" "$HOME/.config/prs/config.yml"
end
