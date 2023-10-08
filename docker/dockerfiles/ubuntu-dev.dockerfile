ARG VARIANT=20.04
FROM zz/ubuntu-${VARIANT}-zzemacs:dev

USER root

# Setup language
RUN apt-get update \
        && DEBIAN_FRONTEND=noninteractive apt-get -y install --no-install-recommends \
        locales \
        && locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8

# Install package
RUN apt-get update \
        && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        rofi xserver-xephyr keynav maim slop xclip acpi rlwrap wmctrl \
        pulseaudio-utils xinput gnome-keyring suckless-tools xdotool \
        nitrogen x11-xserver-utils x11-utils ffmpeg mpv \
        && apt-get autoremove \
        && apt-get clean

# Setup input method
RUN apt-get update \
        && DEBIAN_FRONTEND=noninteractive apt-get -y install --no-install-recommends \
        language-pack-zh-hans dbus-x11 ibus-rime im-config \
        librime-bin librime-data-cangjie5 librime-data-luna-pinyin

# Clean up APT when done.
RUN apt-get clean \
        && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

USER ${USER}

COPY entrypoint.sh /app
ENTRYPOINT ["/app/entrypoint.sh"]
CMD ["zwm"]
