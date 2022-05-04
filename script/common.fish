function info
	echo [(set_color --bold) ' .. ' (set_color normal)] $argv
end

function user
	echo [(set_color --bold) ' ?? ' (set_color normal)] $argv
end

function success
	echo [(set_color --bold green) ' OK ' (set_color normal)] $argv
end

function abort
	echo [(set_color --bold yellow) ABRT (set_color normal)] $argv
	exit 1
end

function on_exit -p %self
	if not contains $argv[3] 0
		echo [(set_color --bold red) FAIL (set_color normal)] "Couldn't setup dotfiles, please open an issue at https://github.com/caarlos0/dotfiles"
	end
end
