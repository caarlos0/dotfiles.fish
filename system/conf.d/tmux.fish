if test -n "$TMUX"
	function __set_tmux_window_name --on-variable PWD
	   tmux rename-window (prompt_pwd)
	end

	tmux rename-window (prompt_pwd)
end
