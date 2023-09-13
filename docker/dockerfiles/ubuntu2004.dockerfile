FROM zz/ubuntu-20.04-zzemacs:dev

USER root

RUN apt-get update \
        && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        rofi \
        && apt-get autoremove \
        && apt-get clean


USER $USER

COPY entrypoint.sh /app
ENTRYPOINT ["/app/entrypoint.sh"]
CMD ["init"]
