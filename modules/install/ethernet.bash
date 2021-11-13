#!/bin/bash

out '[.] Connecting to Ethernet.'

ip addr add $EADDR broadcast + dev $EDEV
ip link set $EDEV up
ip route add default via $EGW

# TODO edit /etc/resolv.conf (it already exists, you can append to it (add also an empty line at the end))
