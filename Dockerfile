FROM alpine:3.2

MAINTAINER Lukasz Czarski <l.czarski@gmail.com>

# Prepare image
RUN apk add keepalived bash --update-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted

ADD keepalived.conf /etc/keepalived/keepalived.conf
ADD start-keepalived.sh /bin/start-keepalived.sh
ADD confconfig.sh /bin/confconfig.sh
ADD entrypoint.sh /bin/entrypoint.sh
ADD notifyscript.sh /bin/notifyscript.sh

RUN chmod +x /bin/confconfig.sh
RUN chmod +x /bin/start-keepalived.sh
RUN chmod +x /bin/entrypoint.sh
RUN chmod +x /bin/notifyscript.sh

ENTRYPOINT ["/bin/entrypoint.sh"]

