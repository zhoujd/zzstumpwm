ARG VARIANT=12
FROM zhoujd/debian-${VARIANT}-zzemacs:dev

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
        pulseaudio-utils xinput gnome-keyring xdotool \
        nitrogen x11-xserver-utils x11-utils ffmpeg mpv \
        evolution evolution-ews sassc libxml2-utils

# Install APP tool
RUN apt-get update \
        && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        fuse lftp

# Setup ibus
RUN apt-get update \
        && DEBIAN_FRONTEND=noninteractive apt-get -y install --no-install-recommends \
        ibus-m17n ibus-rime ibus-data ibus-gtk ibus-gtk3 ibus-clutter \
        librime-bin librime-data-cangjie5 librime-data-luna-pinyin \
        gir1.2-ibus-1.0 python3-ibus-1.0 \
        dbus-x11 im-config zenity

# Setup audio
RUN apt-get update \
        && DEBIAN_FRONTEND=noninteractive apt-get -y install --no-install-recommends \
        alsa-tools \
        alsa-utils \
        libsndfile1-dev \
        pulseaudio

# Clean up APT when done.
RUN apt-get clean \
        && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

USER ${USER}

# Install icon and theme
RUN mkdir -p ~/.themes ~/.icons
RUN wget https://github.com/zhoujd/WhiteSur-gtk-theme/raw/master/release/WhiteSur-Dark.tar.xz \
        && tar xf WhiteSur-Dark.tar.xz -C ~/.themes \
        && rm -f WhiteSur-Dark.tar.xz
RUN wget https://github.com/zhoujd/WhiteSur-icon-theme/archive/refs/heads/master.zip \
        && unzip master.zip \
        && ./WhiteSur-icon-theme-master/install.sh -d ~/.icons \
        && rm -rf WhiteSur-icon-theme-master master.zip
RUN wget https://github.com/zhoujd/WhiteSur-cursors/archive/refs/heads/master.zip \
        && unzip master.zip \
        && rm -rf ~/.icons/WhiteSur-cursors \
        && cp -pr WhiteSur-cursors-master/dist ~/.icons/WhiteSur-cursors \
        && rm -rf WhiteSur-cursors-master master.zip

COPY entrypoint.sh /app
ENTRYPOINT ["/app/entrypoint.sh"]
CMD ["zwm"]
