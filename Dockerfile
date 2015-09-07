FROM alpine:3.2

MAINTAINER Dawid Malinowski <d.malinowski@oberthur.com>

# Prepare image
RUN apk add keepalived --update-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted

ADD start-keepalived.sh /bin/start-keepalived.sh
