static build
============

## Tmux static build

```
## https://github.com/mjakob-gh/build-static-tmux
## https://github.com/mjakob-gh/build-static-tmux/blob/master/build-static-tmux.sh
```
## Linux static tool

```
## https://github.com/ladyrick/static-tools
## https://github.com/ladyrick/static-tools/releases
```

## Screen static build

```
## https://github.com/zoobab/screen-static-coreos
$ wget https://github.com/zoobab/screen-static-coreos/raw/master/bin/screen
$ VER=4.8.0
$ wget http://ftp.gnu.org/gnu/screen/screen-$VER.tar.gz
$ tar -xvzf screen-$VER.tar.gz
$ cd screen-4.8.0
$ ./configure
$ make LDFLAGS="-static"
```
