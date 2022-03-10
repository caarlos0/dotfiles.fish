if test (uname) != Darwin
	exit
end

if command -qs yubikey-agent
	set SSH_AUTH_SOCK (brew --prefix)/var/run/yubikey-agent.sock
end
