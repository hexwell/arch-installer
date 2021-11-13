#!/bin/bash

out '[.] Connecting to Ethernet.'

ip addr add "$EADDR" broadcast + dev eth0
ip link set eth0 up
ip route add default via "$EGW"

echo >> /etc/resolv.conf
echo "nameserver 1.1.1.1" >> /etc/resolv.conf
echo "nameserver 8.8.4.4" >> /etc/resolv.conf
echo >> /etc/resolv.conf
