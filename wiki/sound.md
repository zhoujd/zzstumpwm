Sound control
=============

## Set volume from terminal
   https://unix.stackexchange.com/questions/32206/set-volume-from-terminal

    $ pactl set-sink-volume 0 +15%
    $ pactl set-sink-volume 0 -15%

## pnmixer
   https://github.com/nicklan/pnmixer

    $ sudo apt install pnmixer

## Mute from command lines

    ## https://askubuntu.com/questions/26068/how-do-you-mute-from-the-command-line
    $ DEFAULT_SINK=$(pactl info | grep "Default Sink" | cut -d " " -f3)
    $ DEFAULT_SOURCE=$(pactl info | grep "Default Source" | cut -d " " -f3)
    $ pactl set-sink-mute "$DEFAULT_SINK" "1"
    $ pactl set-source-mute "$DEFAULT_SOURCE" "1"
    $ pactl list sinks | grep "$DEFAULT_SINK" -A 12 | grep Mute
    $ pactl list sources | grep "$DEFAULT_SOURCE" -A 12 | grep Mute
    $ pactl list | grep -E "Name: $DEFAULT_SINK$|Mute" | grep "Name:" -A1 | tail -1 |cut -d: -f2| tr -d " "
    $ pactl list | grep -E "Name: $DEFAULT_SOURCE$|Mute" | grep "Name:" -A1 | tail -1 |cut -d: -f2| tr -d " "
