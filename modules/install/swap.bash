#!/bin/bash

swap_module() {

# IMPORTS:
#   INSTALLATION_MOUNTPOINT
#   root_partition_device
#
# EXPORTS:
#   enable_resume: Set if hibernation is required
#   resume_kernel_params : Resume kernel parameter to enable hibernation

out '[.] Setting up swap...'

# 8192
dd if=/dev/zero of=$INSTALLATION_MOUNTPOINT/swapfile bs=1M count=512
arch-chroot $INSTALLATION_MOUNTPOINT chmod 600 /swapfile
arch-chroot $INSTALLATION_MOUNTPOINT mkswap /swapfile

echo >> $INSTALLATION_MOUNTPOINT/etc/fstab
echo "# swap" >> $INSTALLATION_MOUNTPOINT/etc/fstab
echo "/swapfile none swap defaults 0 0" >> $INSTALLATION_MOUNTPOINT/etc/fstab
echo >> $INSTALLATION_MOUNTPOINT/etc/fstab

local filefrag=$(arch-chroot $INSTALLATION_MOUNTPOINT filefrag -v /swapfile)
local offset=$(echo "$filefrag" | awk '$1=="0:" {print substr($4, 1, length($4)-2)}')

enable_resume=true
resume_kernel_params=" resume=""$root_partition_device"" resume_offset=""$offset"

out '[+] Swap set up.'

}

swap_module
