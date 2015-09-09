# Docker image containing Keepalived

Basic Docker image to run keepalived on host and set additional ip on interface 

To run docker in docker you must add this volumes:
- --net=host
- --privileged=true
- --name keepalived0 (optionally)

You need edit (add) this env:
- VIP=192.168.1.177
- MASK=27
- ROUTERID=Router1
- VROUTERID=111
- STATE=Master
- INTERFACE=eno1
- PRIORITY=100
- ADVERT=1
- AUTHPASS=blah
- SMTPSERV=mail.test.pl
- NOTIFIEMAILFROM=lczarski@gmail.com
- NOTIFIEMAILTO=test@gmail.com


