FROM alpine:3.2

MAINTAINER Lukasz Czarski <l.czarski@oberthur.com>

ADD keepalived.conf /etc/keepalived/keepalived.conf
ADD start-keepalived.sh /bin/start-keepalived.sh
ADD notifyscript.sh /bin/notifyscript.sh

# Prepare image
RUN chmod +x /bin/start-keepalived.sh \
    && chmod +x /bin/notifyscript.sh \
    && apk add keepalived bash --update-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted

ENTRYPOINT ["/bin/start-keepalived.sh"]
