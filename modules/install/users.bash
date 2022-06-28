#!/bin/bash

# IMPORTS:
#   INSTALLATION_MOUNTPOINT
#   chroot
#   USERNAME
#   USERPASS

sed --in-place '/%wheel ALL=(ALL:ALL) ALL/s/^# //' $INSTALLATION_MOUNTPOINT/etc/sudoers

$chroot useradd --create-home --groups wheel --shell /bin/bash $USERNAME
echo $USERNAME:$USERPASS | $chroot chpasswd
