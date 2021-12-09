#!/bin/bash
#set -x -v

SCRIPT_ROOT=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
ZZSTUMPWM_ROOT=$(cd $SCRIPT_ROOT/.. && pwd)

install_zwmrc() {
    ln -sfvT $ZZSTUMPWM_ROOT/misc/.zwmrc ~/.zwmrc
    ln -sfvT $ZZSTUMPWM_ROOT/misc/.zwmrc.d ~/.zwmrc.d
}

install_zwminit() {
    local target=/usr/bin/zwminit
    sudo tee $target <<EOF
#!/bin/sh
for i in ~/.zwmrc.d/*.sh ; do
    test -x "\$i" && "\$i"
done
EOF
    sudo chmod +x $target
}

install_zwmrc
install_zwminit

echo "zwminit setup done"
