function gwt -d "switch between git-wortrees using fzf"
	cd (git worktree list | grep -v '(bare)' | fzf -1 | cut -f1 -d' ')
end
