function gpr -d "git push and fill the pull request with commit info"
	set title (git show --no-patch --format=%s)
	set body (git show --no-patch --format=%b | git interpret-trailers --if-exists replace --trailer Signed-off-by --trim-empty)
	git push origin HEAD
		and gh pr create -a "@me" -d -t "$title" -b "$body"
end
