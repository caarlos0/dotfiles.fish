#!/usr/bin/env fish
if command -qs gh
	gh completion -s fish > ~/.config/fish/completions/gh.fish
end
