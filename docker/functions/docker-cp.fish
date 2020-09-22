function docker-cp -d "Pull, retag and push a docker image"
	docker pull $argv[1]
	docker tag $argv[1] $argv[2]
	docker push $argv[2]
end
