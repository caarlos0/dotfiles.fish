function e -d "edit folders with $WEDITOR"
	set f $argv[1]
	if test -z $f
		set f .
	end
	$WEDITOR $f >/tmp/editor-log 2>&1 &
end
