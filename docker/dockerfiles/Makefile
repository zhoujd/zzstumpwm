## Makefile

.PHONY: ubuntu-dev debian-dev help

all: ubuntu debian
ubuntu: ubuntu-dev
debian: debian-dev

ubuntu-dev:
	make -C ubuntu-dev

debian-dev:
	make -C debian-dev

help:
	@echo "Usage:"
	@echo "$$ make"
	@echo "$$ make all"
	@echo "$$ make help"
	@echo "$$ make ubuntu"
	@echo "$$ make debian"
