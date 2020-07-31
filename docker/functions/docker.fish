function docker -w docker
	if test -z (pgrep com.docker.hyperkit)
		open -g -a Docker.app
		while ! command docker stats --no-stream >/dev/null 2>&1
			echo -n .
			sleep 1
		end
		echo
	end
	switch $argv[1]
	case prune
		command docker system prune --volumes -fa
	case '*'
		command docker $argv
	end
end
