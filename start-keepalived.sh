#!/bin/sh
set -e

echo "=> Configuring Keepalived"

sed -i -e "s/<--VROUTERID-->/${VROUTERID}/g" /etc/keepalived/keepalived.conf
sed -i -e "s/<--STATE-->/${STATE}/g" /etc/keepalived/keepalived.conf
sed -i -e "s/<--INTERFACE-->/${INTERFACE}/g" /etc/keepalived/keepalived.conf
sed -i -e "s/<--PRIORITY-->/${PRIORITY:-100}/g" /etc/keepalived/keepalived.conf
sed -i -e "s/<--AUTHPASS-->/${AUTHPASS}/g" /etc/keepalived/keepalived.conf

for VIP in $( env |grep VIP_ |sort |awk 'match($0, /VIP_[0-9]+/) { print substr( $0, RSTART, RLENGTH )}'| uniq )
do
  VIPx=$( env |grep ${VIP} |sed 's/^[^=]*=//' )
  echo ${VIPx} > ${VIP}
  if [ -n "$( env |grep VIP )" ]; then
  sed -i -e "/virtual_ipaddress {/a\        ${VIPx}" /etc/keepalived/keepalived.conf;
fi
echo "VIP's added"
done

for VIP in $( echo $VIP)
do
   if [ -n "$( env |grep VIP )" ]; then
   sed -i -e "s/<--VIP-->/${VIP}/g" /etc/keepalived/keepalived.conf
fi
echo "VIP added"
done

echo "=> Starting Keepalived ... : "

exec /usr/sbin/keepalived --dont-fork --log-console -f /etc/keepalived/keepalived.conf