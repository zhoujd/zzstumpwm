### .xinitrc
## Usage: startx ~/.xinitrc [wm_name|command]

WM=${1:-dwm}

case "$WM" in
    stumpwm)  exec stumpwm-session ;;
    clfswm)   exec clfswm-session ;;
    zwm)      exec zwm-session ;;
    dwm)      exec dwm-session ;;
    cwm)      exec cwm-session ;;
    *)        exec "$WM" ;;
esac
