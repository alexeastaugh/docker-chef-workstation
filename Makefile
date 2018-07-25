NAME = alexeastaugh/chef-workstation
VERSION = $(shell git log -1 --pretty=%H)

.PHONY: help

help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

all: build

build: ## Build and tag docker image.
	docker build -t $(NAME):$(VERSION) .
