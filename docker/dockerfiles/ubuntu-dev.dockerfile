ARG VARIANT=20.04
FROM zz/ubuntu-${VARIANT}-zzemacs:dev

USER root

RUN apt-get update \
        && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        rofi xserver-xephyr keynav maim slop xclip acpi rlwrap wmctrl \
        nitrogen x11-xserver-utils x11-utils \
        && apt-get autoremove \
        && apt-get clean

# Clean up APT when done.
RUN apt-get clean \
        && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p /tmp/.X11-unix
RUN chmod 1777 /tmp/.X11-unix

USER $USER

COPY entrypoint.sh /app
ENTRYPOINT ["/app/entrypoint.sh"]
CMD ["zwm"]
