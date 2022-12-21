function gotestcovpkg -d "go test cover the given pkg and open report on cocovsh"
	if not set -q argv[1]
		echo "first arg must be a package, e.g. ./..."
		return 1
	end
	go test \
		-v \
		-failfast \
		-race \
		-coverpkg=$argv[1] \
		-covermode=atomic \
		-coverprofile=coverage.txt \
		$argv[1]
	and GOCOVSH_THEME=mocha gocovsh --profile coverage.txt
end
