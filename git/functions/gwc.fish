function gwc -d "create and switch to a new git-wortree using fzf"
	test -f HEAD ||	cd (git rev-parse --show-toplevel)/.. # cd back to bare repo
	set branch (git branch -vlaq | sed -e 's/\+/ /g' -e 's/\*/ /g' | fzf -1 | awk '{print $1}')
	set name $branch
	if set -q argv[1]
		set name $argv[1]
	end
	git worktree add $name $branch
	cd $name
end
