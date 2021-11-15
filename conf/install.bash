#!/bin/bash

source lib/conf.bash


# --- MANDATORY ---

KEYBOARD=it
INSTALLER_MOUNTPOINT=/mnt
DMCRYPTNAME=cryptroot


# Module: Disk Encryption
# --- MANDATORY ---

LUKSPW=x


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


# Module: Personalization
# --- MANDATORY ---

TZ=Europe/Rome
LANG=en_US.UTF-8
HOST=x
PW=x


# --- OPTIONALS ---

# DEVICE=/dev/sdX
