#!/bin/bash

# IMPORTS:
#   out
#   EADDR
#   EGW

out '[.] Connecting to Ethernet.'

ip addr add "$EADDR" dev eth0
ip link set eth0 up
ip route add default via "$EGW"
