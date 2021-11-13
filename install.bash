#!/bin/bash

LOGFILE=log

source conf/install.bash
source lib/base.bash

cd modules/install


# Prepare

source ../check-root.bash
source check-uefi.bash
source set-kb-layout.bash


# Get missing configurations

source ../select-device.bash


# Network

# source ethernet.bash
source wifi.bash
source check-connection.bash
source ntp.bash


# Disk setup

source format-disk.bash
source disk-encryption.bash


# System Installation
source pacstrap.bash
source fstab.bash
source personalization.bash
source mkinitcpio.bash
source bootloader.bash
