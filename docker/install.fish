#!/usr/bin/env fish
curl -sL https://raw.githubusercontent.com/docker/cli/master/contrib/completion/fish/docker.fish -o ~/.config/fish/completions/docker.fish

abbr -a d docker
abbr -a dc docker-compose
