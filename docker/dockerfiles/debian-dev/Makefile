### Emacs in Docker

.PHONY: all
all: debian-dev

VARIANT ?= 12
IMG_NS ?= zhoujd

BUILD_ARG += ## --rm --no-cache
BUILD_ARG += --build-arg VARIANT=$(VARIANT)

Debian_DEV_TAG := $(IMG_NS)/debian-$(VARIANT)-zwm:dev

debian-dev: debian-dev.dockerfile
	docker build $(BUILD_ARG) -t $(Debian_DEV_TAG) -f $< .

.PHONY: clean
clean:
	docker rmi $(Debian_DEV_TAG)

.PHONY: help
help:
	@echo "Usage:"
	@echo "$$ make"
	@echo "$$ make VARIANT=12"
	@echo "$$ make clean"
	@echo "$$ make help"
	@echo "$$ make debian-dev"
