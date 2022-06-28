#!/bin/bash

personalization_module() {

# IMPORTS:
#   chroot
#   INSTALLATION_MOUNTPOINT
#   TZ
#   LANG
#   KEYBOARD
#   HOST
#   ROOTPASS
#
# Optionals:
#   enable_wifi

out '[.] Applying personalizations.'

$chroot ln --symbolic --force /usr/share/zoneinfo/$TZ /etc/localtime
$chroot hwclock --systohc

local LOCALE="$LANG UTF-8"

sed --in-place "/#$LOCALE/s/^#//" $INSTALLATION_MOUNTPOINT/etc/locale.gen

$chroot locale-gen

local locale_conf=$INSTALLATION_MOUNTPOINT/etc/locale.conf

echo "LANG=$LANG" > $locale_conf
echo >> $locale_conf

local vconsole_conf=$INSTALLATION_MOUNTPOINT/etc/vconsole.conf

echo "KEYMAP=$KEYBOARD" > $vconsole_conf
echo >> $vconsole_conf

local hostname=$INSTALLATION_MOUNTPOINT/etc/hostname

echo $HOST > $hostname
echo >> $hostname

echo root:$ROOTPASS | $chroot chpasswd

$chroot systemctl enable NetworkManager

if [[ -v enable_wifi ]]; then
	$chroot systemctl enable iwd
fi

}

personalization_module
