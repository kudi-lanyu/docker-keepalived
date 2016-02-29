FROM oberthur/docker-ubuntu:14.04.4

MAINTAINER Lukasz Czarski <l.czarski@oberthur.com>

ADD keepalived.conf /etc/keepalived/keepalived.conf
ADD start-keepalived.sh /bin/start-keepalived.sh
ADD notifyscript.sh /bin/notifyscript.sh

# Prepare image
RUN chmod +x /bin/start-keepalived.sh \
    && chmod +x /bin/notifyscript.sh \
    &&apt-get update \
    && apt-get install -y keepalived \
    && apt-get clean autoclean \
    && apt-get autoremove --yes \
    && rm -rf /var/lib/{apt,dpkg,cache,log}/

ENTRYPOINT ["/bin/start-keepalived.sh"]
