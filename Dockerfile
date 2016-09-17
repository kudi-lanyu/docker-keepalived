FROM oberthur/docker-ubuntu:14.04.5

MAINTAINER Lukasz Czarski <l.czarski@oberthur.com>

COPY start-keepalived.sh /bin/start-keepalived.sh
COPY notifyscript.sh /bin/notifyscript.sh

# Prepare image
RUN chmod +x /bin/start-keepalived.sh \
    && chmod +x /bin/notifyscript.sh \
    && add-apt-repository ppa:keepalived/stable \
    && apt-get update \
    && apt-get install keepalived \
    && apt-get clean autoclean \
    && apt-get autoremove --yes \
    && rm -rf /var/lib/{apt,dpkg,cache,log}/

COPY keepalived.conf /etc/keepalived/keepalived.conf

ENTRYPOINT ["/bin/start-keepalived.sh"]
