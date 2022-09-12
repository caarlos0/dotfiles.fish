function __trap_exit_tmux
	test -z "$NVIM_LISTEN_ADDRESS" || exit
	test -z "$NVIM" || exit
	test (tmux list-windows | count) = 1 || exit
	test (tmux list-panes | count) = 1 || exit
	tmux switch-client -t default
end

if status --is-interactive
	trap __trap_exit_tmux EXIT
end

