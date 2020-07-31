function jvm -d "set JAVA_HOME to the given version"
	if not set -q argv[1]
		echo (set_color red)missing version argument
		return 1
	end
	set jv $argv[1]
	if test "$jv" -le 8
		set jv "1.$jv"
	end
	set -g -x JAVA_HOME (/usr/libexec/java_home -v "$jv")
end