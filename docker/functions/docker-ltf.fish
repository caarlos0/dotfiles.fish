function docker-ltf -d "Follow the logs of a container"
	command docker logs -tf $argv[1]
end