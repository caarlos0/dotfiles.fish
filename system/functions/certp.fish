function certp -d "prints the certificate of a given domain"
	if not set -q argv[1]
		echo (set_color red)"first argument need to be a domain" >&2
		return 1
	end
	echo | openssl s_client -showcerts -servername $argv[1] -connect $argv[1]:443 2>/dev/null | openssl x509 -inform pem -noout -text
end
