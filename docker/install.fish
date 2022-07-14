#!/usr/bin/env fish
curl -sL https://raw.githubusercontent.com/docker/cli/master/contrib/completion/fish/docker.fish -o $__fish_config_dir/docker.fish

abbr -a d docker
abbr -a dc docker-compose
