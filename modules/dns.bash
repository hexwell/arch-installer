#!/bin/bash

dns_module() {

# IMPORTS:
#   DNS_A
#   DNS_B

local resolv_conf=/etc/resolv_conf

echo >> $resolv_conf
echo "nameserver $DNS_A" >> $resolv_conf
echo "nameserver $DNS_B" >> $resolv_conf

sleep 5

}

dns_module
