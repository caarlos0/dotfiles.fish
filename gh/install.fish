#!/usr/bin/env fish
if command -qs gh
	gh config set git_protocol ssh

	for ext in mislav/gh-branch vilmibm/gh-user-status dlvhdr/gh-prs
		gh extension install $ext || true
	end
end

switch (uname)
case Darwin
	mkdir -p "$HOME/Library/Application Support/prs"
	ln -sf "$DOTFILES/gh/prs.yml" "$HOME/Library/Application Support/prs/sections.yml"
case Linux
	mkdir -p "$HOME/.config/prs"
	ln -sf "$DOTFILES/gh/prs.yml" "$HOME/.config/prs/sections.yml"
end
