tig
===

## Build tig with -static

```bash
# git clone https://github.com/jonas/tig.git
# apk update
# apk add automake autoconf ncurses-static ncurses-dev libncursesw
# ./autogen.sh
# ./configure LDFLAGS=-static
# make
# ls -l src/tig
```

## The .tigrc

```bash
## https://jonas.github.io/tig/doc/manual.html
## https://jonas.github.io/tig/doc/tigrc.5.html
cat > ~/.tigrc <<EOF
### .tigrc

# Misc
set vertical-split = false

# Keys
bind status A ?git commit --amend
bind status F ?git fetch %(remote)
bind status P ?git push -u %(remote) %(repo:head)
EOF
```
