ARG VARIANT=20.04
FROM ubuntu:$VARIANT

RUN apt-get update
RUN apt-get install -qqy xserver-xephyr

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
