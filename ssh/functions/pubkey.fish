function pubkey
	ssh-add -L | pbcopy
		and echo (set_color brblue)'-> Public key copied to clipboard'
end
