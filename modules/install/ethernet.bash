#!/bin/bash

# IMPORTS:
#   out
#   EADDR
#   EGW
#   DNS_A
#   DNS_B

out '[.] Connecting to Ethernet.'

ip addr add "$EADDR" broadcast + dev eth0
ip link set eth0 up
ip route add default via "$EGW"

echo >> /etc/resolv.conf
echo "nameserver ""$DNS_A" >> /etc/resolv.conf
echo "nameserver ""$DNS_B" >> /etc/resolv.conf
echo >> /etc/resolv.conf
