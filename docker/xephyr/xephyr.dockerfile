ARG VARIANT=22.04
FROM ubuntu:$VARIANT

RUN apt-get update \
        && apt-get install -qqy \
        xserver-xephyr

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["bash"]
