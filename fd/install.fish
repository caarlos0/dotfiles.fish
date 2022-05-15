#!/usr/bin/env fish

# on ubuntu, fd is installed as fdfind instead of fd, this links it to a
# local folder which is in PATH.
if command -qs fdfind
	ln -sf (which fdfind) ~/.bin/fd
end
