function gwf -d "git switch to branch with fzf"
	git for-each-ref --sort=-committerdate --format='%(refname:short) (%(committerdate:relative))' refs/heads |
		fzf --reverse --height 35% --nth 1 |
		awk '{ print $1 }' |
		xargs git switch
end
