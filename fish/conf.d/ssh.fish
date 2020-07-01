function pubkey
	more ~/.ssh/id_rsa.pub | pbcopy
		and echo (set_color brblue)'-> Public key copied to clipboard'
end
