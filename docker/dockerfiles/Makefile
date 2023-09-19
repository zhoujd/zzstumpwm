### Emacs in Docker

.PHONY: all
all: ubuntu-dev

VARIANT ?= 20.04

BUILD_ARG += ## --rm --no-cache
BUILD_ARG += --build-arg VARIANT=$(VARIANT)

Ubuntu_DEV_TAG := zz/ubuntu-$(VARIANT)-zwm:dev

ubuntu-dev: ubuntu-dev.dockerfile
	docker build $(BUILD_ARG) -t $(Ubuntu_DEV_TAG) -f $< .

.PHONY: clean
clean:
	docker rmi $(Ubuntu_DEV_TAG)

.PHONY: help
help:
	@echo "Usage:"
	@echo "$$ make"
	@echo "$$ make CTN_USER=zach VARIANT=20.04"
	@echo "$$ make clean"
	@echo "$$ make help"
	@echo "$$ make ubuntu-dev"
