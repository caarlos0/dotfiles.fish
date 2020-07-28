function e -d "edit folders with $VISUAL"
	set f $argv[1]
	if test -z $f
		set f .
	end
	$VISUAL $f >/tmp/editor-log 2>&1 &
end
