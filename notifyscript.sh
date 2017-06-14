#!/bin/bash

STATE=$1
NOW=$(date --iso-8601=seconds)

function cleanup_vips {
      for VIP in $( env | grep VIP | sort | awk -F "=" '{print $2}' ); do
        CHECK=$( ip a | grep ${VIP} | awk '{print $1}' )

        if [ ! -z ${CHECK} ]; then
           echo "${NOW} Remove ip :: ${VIP}" >> /keepalived.log
           ip address del ${VIP}/32 dev eth0
        fi
      done
}

case $STATE in
    "MASTER") touch /keepalived.log
              echo "${NOW} Becoming MASTER" >> /keepalived.log 
              exit 0
              ;;
    "BACKUP") echo "${NOW} Becoming BACKUP" >> /keepalived.log
              cleanup_vips;
              exit 0
              ;;
    "FAULT")  echo "${NOW} Becoming FAULT" >> /keepalived.log
              cleanup_vips;
              exit 0
              ;;
    *)        echo "unknown state"
              echo "${NOW} Becoming UNKOWN" >> /keepalived.log
              cleanup_vips;
              exit 1
              ;;
esac
