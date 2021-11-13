#!/bin/bash

out '[.] Connecting to Ethernet.'

DEV="eth0"
ADDR="172.16.0.2/16"
GW="172.16.0.1"

ip addr add $ADDR broadcast + dev $DEV
ip link set $DEV up
ip route add default via $GW

# TODO edit /etc/resolv.conf
