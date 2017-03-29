FROM oberthur/docker-ubuntu:16.04

ENV KEEPALIVED_VERSION=1.2.23

MAINTAINER Dawid Malinowski <d.malinowski@oberthur.com>

COPY start-keepalived.sh /bin/start-keepalived.sh
COPY notifyscript.sh /bin/notifyscript.sh
COPY check-status.sh /bin/check-status.sh

# Prepare image
RUN chmod +x /bin/*.sh \
    && add-apt-repository ppa:keepalived/stable \
    && apt-get update \
    && apt-get install keepalived=1:${KEEPALIVED_VERSION}* \
    # clean up
    && apt-get clean autoclean \
    && apt-get autoremove --yes \
    && rm -rf /var/lib/{apt,dpkg,cache,log}/ \
    # create the pseudo log file to point to stdout
    && ln -sf /proc/1/fd/1 /keepalived.log

COPY keepalived.conf /etc/keepalived/keepalived.conf

ENTRYPOINT ["/bin/start-keepalived.sh"]
