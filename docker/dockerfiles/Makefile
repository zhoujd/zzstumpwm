### Emacs in Docker

.PHONY: all
all: ubuntu2004

BUILD_ARG += ## --rm --no-cache
Ubuntu2004_TAG := zz/ubuntu-20.04-zwm:base

ubuntu2004: ubuntu2004.dockerfile
	docker build $(BUILD_ARG) -t $(Ubuntu2004_TAG) -f $< .

.PHONY: clean
clean:
	docker rmi $(Ubuntu2004_TAG)

.PHONY: help
help:
	@echo "Usage:"
	@echo "$$ make"
	@echo "$$ make CTN_USER=zach"
	@echo "$$ make clean"
	@echo "$$ make help"
	@echo "$$ make ubuntu2004"
