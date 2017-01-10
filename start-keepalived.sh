#!/bin/sh
set -e

echo "=> Configuring Keepalived"

sed -i -e "s/<--VROUTERID-->/${VROUTERID}/g" /etc/keepalived/keepalived.conf
sed -i -e "s/<--VIP-->/${VIP}/g" /etc/keepalived/keepalived.conf
sed -i -e "s/<--VIP2-->/${VIP2}/g" /etc/keepalived/keepalived.conf
sed -i -e "s/<--STATE-->/${STATE}/g" /etc/keepalived/keepalived.conf
sed -i -e "s/<--INTERFACE-->/${INTERFACE}/g" /etc/keepalived/keepalived.conf
sed -i -e "s/<--PRIORITY-->/${PRIORITY:-100}/g" /etc/keepalived/keepalived.conf
sed -i -e "s/<--AUTHPASS-->/${AUTHPASS}/g" /etc/keepalived/keepalived.conf

echo "=> Starting Keepalived ... : "

exec /usr/sbin/keepalived --dont-fork --log-console -f /etc/keepalived/keepalived.conf 


