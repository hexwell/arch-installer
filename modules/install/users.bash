#!/bin/bash

# IMPORTS:
#   INSTALLATION_MOUNTPOINT
#   USERNAME
#   USERPASS

sed --in-place '/%wheel ALL=(ALL:ALL) ALL/s/^# //' $INSTALLATION_MOUNTPOINT/etc/sudoers

arch-chroot $INSTALLATION_MOUNTPOINT useradd --create-home --groups wheel --shell /bin/bash "$USERNAME"
echo "$USERNAME"":""$USERPASS" | arch-chroot $INSTALLATION_MOUNTPOINT chpasswd
