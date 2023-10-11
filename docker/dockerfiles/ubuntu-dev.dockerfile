ARG VARIANT=20.04
FROM zz/ubuntu-${VARIANT}-zzemacs:dev

USER root

# Setup language
RUN apt-get update \
        && DEBIAN_FRONTEND=noninteractive apt-get -y install --no-install-recommends \
        locales \
        && locale-gen en_US.UTF-8
ENV LANG=en_US.UTF-8 \
        GTK_IM_MODULE=xim \
        QT4_IM_MODULE=xim \
        QT_IM_MODULE=ibus \
        XMODIFIERS=@im=ibus \
        CLUTTER_IM_MODULE=xim

# Install package
RUN apt-get update \
        && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        rofi xserver-xephyr keynav maim slop xclip acpi rlwrap wmctrl unzip \
        pulseaudio-utils xinput gnome-keyring suckless-tools xdotool lftp \
        nitrogen x11-xserver-utils x11-utils ffmpeg mpv \
        evolution evolution-ews sassc libxml2-utils \
        && apt-get autoremove \
        && apt-get clean

# Setup input method
RUN apt-get update \
        && DEBIAN_FRONTEND=noninteractive apt-get -y install --no-install-recommends \
        ibus-m17n ibus-rime language-pack-zh-hans dbus-x11 im-config zenity \
        librime-bin librime-data-cangjie5 librime-data-luna-pinyin

# Clean up APT when done.
RUN apt-get clean \
        && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

USER ${USER}

# Install icon and theme
RUN mkdir -p ~/.themes ~/.icons
RUN wget https://github.com/vinceliuice/WhiteSur-gtk-theme/raw/master/release/WhiteSur-Dark-44-0.tar.xz \
        && tar xf WhiteSur-Dark-44-0.tar.xz -C ~/.themes \
        && rm -f WhiteSur-Dark-44-0.tar.xz
RUN wget https://github.com/vinceliuice/WhiteSur-icon-theme/archive/refs/heads/master.zip \
        && unzip master.zip \
        && ./WhiteSur-icon-theme-master/install.sh -d ~/.icons \
        && rm -rf WhiteSur-icon-theme-master master.zip
RUN wget https://github.com/vinceliuice/McMojave-cursors/archive/refs/heads/master.zip \
        && unzip master.zip \
        && rm -rf ~/.icons/McMojave-cursors \
        && cp -pr McMojave-cursors-master/dist ~/.icons/McMojave-cursors \
        && rm -rf McMojave-cursors-master master.zip

COPY entrypoint.sh /app
ENTRYPOINT ["/app/entrypoint.sh"]
CMD ["zwm"]
