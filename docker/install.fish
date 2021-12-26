#!/usr/bin/env fish
curl -sL https://raw.githubusercontent.com/docker/cli/master/contrib/completion/fish/docker.fish -o ~/.config/fish/completions/docker.fish

abbr -a d docker
abbr -a dc docker-compose
abbr -a dps docker ps
abbr -a dimg 'docker images | sort -n'
abbr -a dimgz 'docker images | sort -k5 -h'