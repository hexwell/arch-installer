#!/bin/bash

source lib/conf.bash

# EXPORTS:
#   LOGFILE  : Log file
#   WSSID    : WiFi SSID
#   WPASS    : WiFi passphrase
#   LOCKER_PKG : Pacman package of locker
#   LOCKER_CMD : Command of locker
#   USERNAME : User name
#   USERPASS : User passphrase

#   EADDR    : Ethernet IP address
#   EGW      : Ethernet default gateway
#   DNS_A    : Ethernet DNS
#   DNS_B    : Ethernet fallback DNS


# Module: Base
# --- MANDATORY ---

LOGFILE=desktop.log


# Module: Ethernet
# --- MANDATORY ---

# EADDR=x.x.x.x/x
# EGW=x.x.x.x


# Module: WiFi
# --- MANDATORY ---

WSSID=x
WPASS=x


# Module: Resolv
# --- MANDATORY ---

# DNS_A=1.1.1.1
# DNS_B=8.8.4.4


# Module: Xorg, utils

LOCKER_PKG=slock
LOCKER_CMD=$LOCKER_PKG


# Module: User, dotfiles
# --- MANDATORY ---

USERNAME=x
USERPASS=x
