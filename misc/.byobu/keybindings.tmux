#### keybindings.tmux

unbind-key -n C-b
set -g prefix ^B
set -g prefix2 F12
bind b send-prefix

##load configure
source ~/.tmux.conf
