.DEFAULT_GOAL := usage

# user and repo
USER        = $$(whoami)
CURRENT_DIR = $(notdir $(shell pwd))

# terminal colours
RED     = \033[0;31m
GREEN   = \033[0;32m
YELLOW  = \033[0;33m
NC      = \033[0m

.PHONY: install
install:
	brew bundle

.PHONY: slides
slides:
	slides -v

.PHONY: site
site:
	pushd docs && \
	bundle && \
	bundle exec jekyll serve --livereload && \
	popd 

.PHONY: usage
usage:
	@echo
	@echo "Hi ${GREEN}${USER}!${NC} Welcome to ${RED}${CURRENT_DIR}${NC}"
	@echo
	@echo "${YELLOW}make site${NC}     "
	@echo "${YELLOW}make install${NC}  "
	@echo "${YELLOW}make slides${NC}   "
	@echo
