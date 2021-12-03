#!/bin/bash

# IMPORTS:
#   DNS_A
#   DNS_B

echo >> /etc/resolv.conf
echo "nameserver ""$DNS_A" >> /etc/resolv.conf
echo "nameserver ""$DNS_B" >> /etc/resolv.conf
echo >> /etc/resolv.conf

sleep 5
