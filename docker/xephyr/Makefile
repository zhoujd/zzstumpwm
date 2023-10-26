### Xephyr in Docker

.PHONY: all clean help
all: xephyr-dev

VARIANT ?= 20.04
IMG_NS ?= zhoujd

BUILD_ARG += ## --rm --no-cache
BUILD_ARG += --build-arg VARIANT=$(VARIANT)

Xephyr_DEV_TAG := $(IMG_NS)/ubuntu-$(VARIANT)-xephyr:dev

xephyr-dev: xephyr.dockerfile
	docker build $(BUILD_ARG) -t $(Xephyr_DEV_TAG) -f $< .

clean:
	docker rmi $(Xephyr_DEV_TAG)

help:
	@echo "Usage:"
	@echo "$$ make"
	@echo "$$ make VARIANT=20.04"
	@echo "$$ make clean"
	@echo "$$ make help"
	@echo "$$ make xephyr-dev"
