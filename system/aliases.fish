abbr --add l 'ls -lAh'
abbr --add la 'ls -A'
abbr --add ll 'ls -l'
abbr --add less 'less -r'

function mkc -d "create a new dir and cd into it"
	mkdir -p $argv[1]
		and cd $argv[1]
end
