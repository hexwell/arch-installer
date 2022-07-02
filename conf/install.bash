#!/bin/bash

source lib/conf.bash

# EXPORTS:
#   LOGFILE  : Log file
#   KEYBOARD : Keyboard layout
#   DEVICE   : Installation device
#   WSSID    : WiFi SSID
#   WPASS    : WiFi passphrase
#   LUKSPASS : LUKS disk encryption passphrase
#   DMNAME   : LUKS disk encryption device mapper name
#   INSTALLATION_MOUNTPOINT : Mountpoint of the new installation
#   TZ       : Timezone
#   LANG     : Language locale
#   HOST     : New OS hostname
#   ROOTPASS : New OS root user passphrase
#   SWAP_SIZE_MiB           : Size of the swapfile in MiB
#   REPOSITORY_LOCATION     : Location of the git repository folder

#   EADDR    : Ethernet IP address
#   EGW      : Ethernet default gateway
#   DNS_A    : DNS
#   DNS_B    : Fallback DNS

# Module: Base
# --- MANDATORY ---

LOGFILE=install.log


# Module: Set KB layout, personalization
# --- MANDATORY ---

KEYBOARD=it


# Module: Confirm device
# --- MANDATORY ---

DEVICE=/dev/sdX


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


# Module: Disk encryption
# --- MANDATORY ---

LUKSPASS=x
DMNAME=cryptroot


# Modules: Format and mount, pacstrap, fstab, personalization, users, swap, mkinitcpio
# --- MANDATORY ---

INSTALLATION_MOUNTPOINT=/mnt


# Module: Personalization
# --- MANDATORY ---

TZ=Europe/Rome
LANG=en_US.UTF-8
HOST=x
ROOTPASS=x


# Module: Swap
# --- MANDATORY ---

# TODO Maybe this should be calculated automatically?
# TODO Maybe this should be in GB?
SWAP_SIZE_MiB=8192


# Module: Desktop
# --- MANDATORY ---

REPOSITORY_LOCATION=/mn/
