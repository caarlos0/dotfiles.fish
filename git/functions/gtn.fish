function gtn -d "create the next semantic tag and push"
	git tag (svu n --force-patch-increment)
		and svu c
end
