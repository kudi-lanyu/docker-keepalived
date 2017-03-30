#!/bin/bash

STATE=$1
NOW=$(date --iso-8601=seconds)

case $STATE in
        "MASTER") touch /keepalived.log
                  echo "${NOW} Becoming MASTER" >> /keepalived.log 
                  exit 0
                  ;;
        "BACKUP") echo "${NOW} Becoming BACKUP" >> /keepalived.log
                  exit 0
                  ;;
        "FAULT")  echo "${NOW} Becoming FAULT" >> /keepalived.log
                  exit 0
                  ;;
        *)        echo "unknown state"
                  echo "${NOW} Becoming UNKOWN" >> /keepalived.log
                  exit 1
                  ;;
esac
