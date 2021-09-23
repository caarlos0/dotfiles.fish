function docker -w docker
	switch $argv[1]
	case 'exit'
		pkill Docker
	case prune
		_docker_start
		command docker system prune --volumes -fa
	case '*'
		_docker_start
		command docker $argv
	end
end

function _docker_start
	switch (uname)
	case Darwin
		if test (pgrep com.docker.driver | wc -l) -eq 0
			open -g -j -a Docker.app
			while ! command docker stats --no-stream >/dev/null 2>&1
				echo -n .
				sleep 1
			end
			echo
		end
	end
end
