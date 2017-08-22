#!/bin/bash
set -e

echo "=> Configuring Keepalived"

sed -i -e "s/<--INTERVAL-->/${INTERVAL_VRRP_SCRIPT_CHECK:-3}/g" /etc/keepalived/keepalived.conf
sed -i -e "s/<--VROUTERID-->/${VROUTERID}/g" /etc/keepalived/keepalived.conf
sed -i -e "s/<--STATE-->/${STATE}/g" /etc/keepalived/keepalived.conf
sed -i -e "s/<--INTERFACE-->/${INTERFACE}/g" /etc/keepalived/keepalived.conf
sed -i -e "s/<--PRIORITY-->/${PRIORITY:-100}/g" /etc/keepalived/keepalived.conf
sed -i -e "s/<--AUTHPASS-->/${AUTHPASS}/g" /etc/keepalived/keepalived.conf

for VIP in $( env | grep VIP | sort | awk -F "=" '{print $2}' )
do
  if grep -q $VIP /etc/keepalived/keepalived.conf;
  then
    echo "VIP ${VIP} already added"
  else
    echo "Adding VIP: ${VIP}"
    sed -i -e "s/virtual_ipaddress {/virtual_ipaddress {\n        ${VIP}/" /etc/keepalived/keepalived.conf;
  fi
done

echo "=> Starting Keepalived ... : "
cat /etc/keepalived/keepalived.conf

exec /usr/sbin/keepalived --dont-fork --log-console -f /etc/keepalived/keepalived.conf
