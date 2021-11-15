#!/bin/bash

personalization_module() {

# IMPORTS:
#   INSTALLATION_MOUNTPOINT : mountpoint of the new installation
#   PASS : the root passphrase
#
# Optionals:
#   WIFI : set if WiFi is required

out '[.] Applying personalizations.'

arch-chroot $INSTALLATION_MOUNTPOINT ln -sf /usr/share/zoneinfo/""$TZ"" /etc/localtime
arch-chroot $INSTALLATION_MOUNTPOINT hwclock --systohc

local LOCALE="$LANG"" UTF-8"

sed -i "/#""$LOCALE""/s/^#//" $INSTALLATION_MOUNTPOINT/etc/locale.gen

arch-chroot $INSTALLATION_MOUNTPOINT locale-gen

echo "LANG=""$LANG" > $INSTALLATION_MOUNTPOINT/etc/locale.conf
echo >> $INSTALLATION_MOUNTPOINT/etc/locale.conf

echo "KEYMAP=""$KEYBOARD" > $INSTALLATION_MOUNTPOINT/etc/vconsole.conf
echo >> $INSTALLATION_MOUNTPOINT/etc/vconsole.conf

echo "$HOST" > $INSTALLATION_MOUNTPOINT/etc/hostname
echo >> $INSTALLATION_MOUNTPOINT/etc/hostname

echo root:$PASS | arch-chroot $INSTALLATION_MOUNTPOINT chpasswd

arch-chroot $INSTALLATION_MOUNTPOINT systemctl enable NetworkManager

set +u
if [ -v WIFI ]; then
	arch-chroot $INSTALLATION_MOUNTPOINT systemctl enable iwd
fi
set -u

}

personalization_module
