VERSION ?= $(shell git describe --tags --always)

.PHONY: all
all: help

###############
##@ Development

.PHONY: setup
setup:   ## setup workspace
	rm -f .git/hooks/commit-msg \
	&& curl --fail -o .git/hooks/commit-msg https://raw.githubusercontent.com/hazcod/semantic-commit-hook/master/commit-msg \
	&& chmod 500 .git/hooks/commit-msg

###########
##@ Release

.PHONY: changelog
changelog:   ## Generate changelog
	@ $(MAKE) --no-print-directory log-$@
	git-chglog --next-tag $(VERSION) -o CHANGELOG.md

.PHONY: release
release: changelog   ## Release a new tag
	@ $(MAKE) --no-print-directory log-$@
	git add CHANGELOG.md
	git commit -m "chore: update changelog for $(VERSION)"
	git tag $(VERSION)
	git push origin master $(VERSION)

########
##@ Help

.PHONY: help
help:   ## Display this help
	@awk \
		-v "col=\033[36m" -v "nocol=\033[0m" \
		' \
			BEGIN { \
				FS = ":.*##" ; \
				printf "Usage:\n  make %s<target>%s\n", col, nocol \
			} \
			/^[a-zA-Z_-]+:.*?##/ { \
				printf "  %s%-12s%s %s\n", col, $$1, nocol, $$2 \
			} \
			/^##@/ { \
				printf "\n%s%s%s\n", nocol, substr($$0, 5), nocol \
			} \
		' $(MAKEFILE_LIST)

log-%:
	@grep -h -E '^$*:.*?## .*$$' $(MAKEFILE_LIST) | \
		awk \
			'BEGIN { \
				FS = ":.*?## " \
			}; \
			{ \
				printf "\033[36m==> %s\033[0m\n", $$2 \
			}'