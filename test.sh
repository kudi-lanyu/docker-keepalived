#!bin/bash
docker run --net=host --privileged=true -e VIP=192.168.1.175 -e MASK=27 -e VROUTERID=112 -e STATE=Master -e INTERFACE=eno1 -e PRIORITY=100 -e ADVERT=1 -e AUTHPASS=dupa  -e SMTPSERV=mail.test.pl -e NOTIFIEMAILFROM=lukasbaranski.it@gmail.com -e NOTIFIEMAILTO=test@gmail.com --name keepalived0 -d  tanktest3 
