#!/bin/bash

source lib/conf.bash

# EXPORTS:
#   LOGFILE  : Log file
#   EADDR    : Ethernet IP address
#   EGW      : Ethernet default gateway
#   WSSID    : WiFi SSID
#   WPASS    : WiFi passphrase
#   DNS_A    : Ethernet DNS
#   DNS_B    : Ethernet fallback DNS
#   USER     : Username


# Module: Base
# --- MANDATORY ---

LOGFILE=personalize.log


# Module: Ethernet
# --- MANDATORY ---

EADDR=x.x.x.x/x
EGW=x.x.x.x


# Module: WiFi
# --- MANDATORY ---

WSSID=x
WPASS=x


# Module: Resolv
# --- MANDATORY ---

DNS_A=1.1.1.1
DNS_B=8.8.4.4


# Modules: Yay, WM
# --- MANDATORY ---

USER=x
