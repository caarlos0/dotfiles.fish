function gtn -d "create the next semantic tag and push"
	set next (svu n --force-patch-increment)
	git tag -m "$next" "$next"
		and svu c
end
