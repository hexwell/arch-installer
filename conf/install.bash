#!/bin/bash

source lib/conf.bash

# EXPORTS:
#   LOGFILE  : Log file
#   KEYBOARD : Keyboard layout
#   DEVICE   : Installation device
#   EADDR    : Ethernet IP address
#   EGW      : Ethernet default gateway
#   DNS_A    : Ethernet DNS
#   DNS_B    : Ethernet fallback DNS
#   WSSID    : WiFi SSID
#   WPASS    : WiFi passphrase
#   LUKSPASS : LUKS disk encryption passphrase
#   DMNAME   : LUKS disk encryption device mapper name
#   INSTALLATION_MOUNTPOINT : Mountpoint of the new installation
#   TZ       : Timezone
#   LANG     : Language locale
#   HOST     : New OS hostname
#   PASS     : New OS root user passphrase


# Module: Base
# --- MANDATORY ---

LOGFILE=log


# Module: Set KB layout, personalization
# --- MANDATORY ---

KEYBOARD=it


# Module: Confirm device
# --- MANDATORY ---
DEVICE=/dev/sdX


# Module: Ethernet
# --- MANDATORY ---

EADDR=x.x.x.x/x
EGW=x.x.x.x
DNS_A=1.1.1.1
DNS_B=8.8.4.4


# Module: WiFi
# --- MANDATORY ---

WSSID=x
WPASS=x


# Module: Disk encryption
# --- MANDATORY ---

LUKSPASS=x
DMNAME=cryptroot


# Modules: Format and mount, pacstrap, fstab, personalization, mkinitcpio, swap
# --- MANDATORY ---

INSTALLATION_MOUNTPOINT=/mnt


# Module: Personalization
# --- MANDATORY ---

TZ=Europe/Rome
LANG=en_US.UTF-8
HOST=x
PASS=x
