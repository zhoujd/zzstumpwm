### Emacs in Docker

.PHONY: all
all: ubuntu2004 ubuntu2204

CTN_USER ?= ${USER}

BUILD_ARG += ## --rm --no-cache
BUILD_ARG += --build-arg USER_NAME=$(CTN_USER)
BUILD_ARG += --build-arg USER_UID=$(shell id -u ${USER})
BUILD_ARG += --build-arg USER_GID=$(shell id -g ${USER})
BUILD_ARG += --build-arg DOCKER_GID=$(shell getent group docker | cut -d: -f3)

Ubuntu2004_TAG := zz/ubuntu-20.04-zwm:base
Ubuntu2204_TAG := zz/ubuntu-22.04-zwm:base

ubuntu2004: ubuntu2004.dockerfile
	docker build $(BUILD_ARG) -t $(Ubuntu2004_TAG) -f $< .

ubuntu2204: ubuntu2204.dockerfile
	docker build $(BUILD_ARG) -t $(Ubuntu2204_TAG) -f $< .

.PHONY: clean
clean:
	docker rmi $(Ubuntu2004_TAG)
	docker rmi $(Ubuntu2204_TAG)

.PHONY: help
help:
	@echo "Usage:"
	@echo "$$ make"
	@echo "$$ make CTN_USER=zach"
	@echo "$$ make clean"
	@echo "$$ make help"
	@echo "$$ make ubuntu2004"
	@echo "$$ make ubuntu2204"
