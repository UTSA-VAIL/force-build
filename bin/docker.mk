DOCKER_ROOT ?= builds/common
DOCKER_REGISTRY ?= utsavisionailab
DOCKER_REPO ?= common-build
CURR_DIR = $(shell pwd)
MODEL_PATH = /home/$(shell whoami)/model

.PHONY: build
build:
	docker build \
		--build-arg DOCKER_REPO=$(DOCKER_REPO) \
		--build-arg DOCKER_REGISTRY=$(DOCKER_REGISTRY) \
		--build-arg MODEL_PATH=$(MODEL_PATH) \
		--build-arg BIN_PATH=$(CURR_DIR)/bin \
		--cache-from $(DOCKER_REGISTRY)/$(DOCKER_REPO):latest \
		-t $(DOCKER_REPO):local \
		-f $(CURR_DIR)/$(DOCKER_ROOT)/Dockerfile \
		$(CURR_DIR)/$(DOCKER_ROOT)
