# keepalived
Just running keepalived on host == set additional ip on interface 

Howto run? and test
docker run --net=host --privileged=true -e VIP=192.168.1.177 -e MASK=27 -e ROUTERID=Router1 -e VROUTERID=111 -e STATE=Master -e INTERFACE=eno1 -e PRIORITY=100 -e ADVERT=1 -e AUTHPASS=dupa  -e SMTPSERV=mail.test.pl -e NOTIFIEMAILFROM=lczarski@gmail.com -e NOTIFIEMAILTO=test@gmail.com --name keepalived0 -d  tanktest3 


