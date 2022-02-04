function gpr -d "git push and fill the pull request on the browser"
	git push origin HEAD
		and gh pr create -a "@me" -f -d
end
