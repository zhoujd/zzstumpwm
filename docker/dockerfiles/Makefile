### Emacs in Docker

.PHONY: all
all: ubuntu-dev

VARIANT ?= 22.04
IMG_NS ?= zhoujd

BUILD_ARG += ## --rm --no-cache
BUILD_ARG += --build-arg VARIANT=$(VARIANT)

Ubuntu_DEV_TAG := $(IMG_NS)/ubuntu-$(VARIANT)-zwm:dev

ubuntu-dev: ubuntu-dev.dockerfile
	docker build $(BUILD_ARG) -t $(Ubuntu_DEV_TAG) -f $< .

.PHONY: clean
clean:
	docker rmi $(Ubuntu_DEV_TAG)

.PHONY: help
help:
	@echo "Usage:"
	@echo "$$ make"
	@echo "$$ make VARIANT=22.04"
	@echo "$$ make clean"
	@echo "$$ make help"
	@echo "$$ make ubuntu-dev"
