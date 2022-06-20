#!/bin/bash

# IMPORTS:
#   INSTALLATION_MOUNTPOINT
#   USERNAME
#   USERPASS

sed -i '/%wheel ALL=(ALL:ALL) ALL/s/^# //' $INSTALLATION_MOUNTPOINT/etc/sudoers

arch-chroot $INSTALLATION_MOUNTPOINT useradd -m -G wheel -s /bin/bash "$USERNAME"
echo "$USERNAME"":""$USERPASS" | arch-chroot $INSTALLATION_MOUNTPOINT chpasswd

echo \# fix for DEL key not working in terminals > $INSTALLATION_MOUNTPOINT/home/$USERNAME/.inputrc
echo >> $INSTALLATION_MOUNTPOINT/home/$USERNAME/.inputrc
echo set enable-keypad on >> $INSTALLATION_MOUNTPOINT/home/$USERNAME/.inputrc
