ARG VARIANT=20.04
FROM zz/ubuntu-${VARIANT}-zzemacs:dev

USER root

# Install package
RUN apt-get update \
        && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        rofi xserver-xephyr keynav maim slop xclip acpi rlwrap wmctrl \
        nitrogen x11-xserver-utils x11-utils suckless-tools ibus-rime dbus-x11 \
        && apt-get autoremove \
        && apt-get clean

# Setup language
RUN apt-get update \
        && DEBIAN_FRONTEND=noninteractive apt-get -y install locales \
        && locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Clean up APT when done.
RUN apt-get clean \
        && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

USER ${USER}

COPY entrypoint.sh /app
ENTRYPOINT ["/app/entrypoint.sh"]
CMD ["zwm"]
