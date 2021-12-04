#!/bin/bash

source conf/install.bash
source lib/base.bash

cd modules/install


# Prepare

source ../check_root.bash
source check_uefi.bash
source set_kb_layout.bash


# Get missing configurations

source ../confirm_device.bash


# Network

# source ../ethernet.bash
source ../wifi.bash
# source ../resolv.bash
source ../check_connection.bash
source ntp.bash


# Disk setup

source partition_disk.bash
source disk_encryption.bash
source format_and_mount.bash


# System Installation
source pacstrap.bash
source fstab.bash
source personalization.bash
source users.bash
source swap.bash
source mkinitcpio.bash
source efistub_bootloader.bash

out '[+] Done.'
