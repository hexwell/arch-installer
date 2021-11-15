#!/bin/bash

personalization_module() {

# IMPORTS:
#   INSTALLATION_MOUNTPOINT : mountpoint of the new installation
#   PASS : the root passphrase
#
# Optionals:
#   WIFI : set if WiFi is required

out '[.] Applying personalizations.'

arch-chroot $INSTALLER_MOUNTPOINT ln -sf /usr/share/zoneinfo/""$TZ"" /etc/localtime
arch-chroot $INSTALLER_MOUNTPOINT hwclock --systohc

local LOCALE="$LANG"" UTF-8"

sed -i "/#""$LOCALE""/s/^#//" $INSTALLER_MOUNTPOINT/etc/locale.gen

arch-chroot $INSTALLER_MOUNTPOINT locale-gen

echo "LANG=""$LANG" > $INSTALLER_MOUNTPOINT/etc/locale.conf
echo >> $INSTALLER_MOUNTPOINT/etc/locale.conf

echo "KEYMAP=""$KEYBOARD" > $INSTALLER_MOUNTPOINT/etc/vconsole.conf
echo >> $INSTALLER_MOUNTPOINT/etc/vconsole.conf

echo "$HOST" > $INSTALLER_MOUNTPOINT/etc/hostname
echo >> $INSTALLER_MOUNTPOINT/etc/hostname

echo root:$PASS | arch-chroot $INSTALLER_MOUNTPOINT chpasswd

arch-chroot $INSTALLER_MOUNTPOINT systemctl enable NetworkManager

set +u
if [ -v WIFI ]; then
	arch-chroot $INSTALLER_MOUNTPOINT systemctl enable iwd
fi
set -u

}

personalization_module
