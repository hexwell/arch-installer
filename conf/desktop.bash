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
#   USERNAME : Username
#   LOCKER_PKG : Pacman package of locker
#   LOCKER_CMD : Command of locker


# Module: Base
# --- MANDATORY ---

LOGFILE=desktop.log


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


# Modules: Yay, ly LM, Dotfiles
# --- MANDATORY ---

# TODO Make this automatic
USERNAME=x


# Modules: Xorg, Utils

LOCKER_PKG=slock
LOCKER_CMD=$LOCKER_PKG
