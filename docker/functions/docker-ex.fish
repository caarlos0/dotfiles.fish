function docker-ex -d "Exec with a sh into a container"
	command docker exec -it $argv[1] sh
end