#!/usr/bin/env fish
if command -qs fdfind
    ln -sf (which fdfind) ~/.bin/fd
end

if command -qs batcat
    ln -sf (which batcat) ~/.bin/bat
end

if command -qs zoxide
    zoxide init fish >$__fish_config_dir/conf.d/zoxide.fish
end

if command -qs fzf
    set -Ux FZF_DEFAULT_OPTS "\
		--color=bg:#000000,bg+:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
		--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
		--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"
end
