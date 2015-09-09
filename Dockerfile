FROM alpine:3.2

MAINTAINER Lukasz Czarski <l.czarski@oberthur.com>

# Prepare image
RUN apk add keepalived bash --update-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted

ADD keepalived.conf /etc/keepalived/keepalived.conf
ADD start-keepalived.sh /bin/start-keepalived.sh
ADD notifyscript.sh /bin/notifyscript.sh

ENTRYPOINT ["/bin/start-keepalived.sh"]
