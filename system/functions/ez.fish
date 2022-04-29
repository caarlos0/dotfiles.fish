function ez -d "edit files with $WEDITOR"
	set f (zoxide query $argv[1])
	if test -z $f
		return 1
	end
	$WEDITOR $f >/tmp/editor-log 2>&1 &
end
