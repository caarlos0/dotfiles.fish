function myip -d "print my external ip"
	curl -w '%{stdout}\n' ifconfig.me
end
