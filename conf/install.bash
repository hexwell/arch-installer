#!/bin/bash

source lib/conf.bash


# --- MANDATORY ---

LOGFILE=log
INSTALLATION_MOUNTPOINT=/mnt
DEVICE=/dev/sdX


# Module: Set KB Layout
# --- MANDATORY ---

KEYBOARD=it


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


# Module: Disk Encryption
# --- MANDATORY ---

LUKSPASS=x
DMNAME=cryptroot


# Module: Personalization
# --- MANDATORY ---

TZ=Europe/Rome
LANG=en_US.UTF-8
HOST=x
PASS=x
