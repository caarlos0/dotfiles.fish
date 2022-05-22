function ez -d "edit files with $EDITOR"
	set f (zoxide query $argv[1])
	if test -z $f
		return 1
	end
	$EDITOR $f
end
