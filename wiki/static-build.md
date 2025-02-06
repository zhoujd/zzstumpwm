Static Build
============

## Awesome CLI

```
## https://github.com/toolleeo/awesome-cli-apps-in-a-csv
## https://github.com/frontaid/git-cli-tools
## https://terminaltrove.com/list/
```

## Tmux static build

```
## https://github.com/mjakob-gh/build-static-tmux
## https://github.com/mjakob-gh/build-static-tmux/blob/master/build-static-tmux.sh
```

## Download and run CLI tools on Linux and Mac

```
## https://1bin.org/
## https://github.com/nikvdp/1bin
```

## Linux static tool

```
## https://github.com/ladyrick/static-tools
## https://github.com/ladyrick/static-tools/releases
## https://github.com/andrew-d/static-binaries
## https://github.com/andrew-d/static-binaries/tree/master/binaries/linux/x86_64
## https://github.com/ryanwoodsmall/static-binaries
## https://github.com/ryanwoodsmall/static-binaries/tree/master/x86_64
```

## Screen static build

```
## https://github.com/zoobab/screen-static-coreos
## https://github.com/zoobab/screen-static-coreos/raw/master/bin/screen
$ VER=4.8.0
$ wget http://ftp.gnu.org/gnu/screen/screen-${VER}.tar.gz
$ tar -xvzf screen-${VER}.tar.gz
$ cd screen-${VER}
$ ./configure --with-sys-screenrc=~/.screenrc
$ make LDFLAGS="-static"

## Custom SCREENDIR (optional)
sudo tee /etc/profile.d/zz-screen.sh <<EOF
#!/bin/bash
mkdir -p \$HOME/.local/run/screen
chmod 700 \$HOME/.local/run/screen
export SCREENDIR=\$HOME/.local/run/screen
EOF
```

## BusyBox

```
## https://www.busybox.net/
## https://wiki.alpinelinux.org/wiki/BusyBox
## https://github.com/ladyrick/static-tools/releases/download/v1.2/busybox.amd64

```

## Toybox

```
## https://landley.net/toybox/bin/
## https://landley.net/toybox/bin/toybox-x86_64
## https://github.com/landley/toybox
## https://landley.net/toybox/downloads/binaries/toolchains/latest/
```

## miniserve - a CLI tool to serve files and dirs over HTTP

```
## https://lib.rs/crates/miniserve
## https://github.com/svenstaro/miniserve
## https://github.com/svenstaro/miniserve/releases
```
