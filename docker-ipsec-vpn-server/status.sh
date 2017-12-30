#!/bin/sh
#docker exec -it ipsec-vpn-server ipsec status

docker exec -it ipsec-vpn-server ipsec whack --trafficstatus
