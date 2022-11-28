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

out '[.] Applying personalizations.'

$chroot ln --symbolic --force /usr/share/zoneinfo/$TZ /etc/localtime
$chroot hwclock --systohc

local LOCALE="$LANG UTF-8"

sed --in-place "/#$LOCALE/s/^#//" $INSTALLATION_MOUNTPOINT/etc/locale.gen

$chroot locale-gen
$chroot localectl set-locale LANG=$LANG
$chroot localectl set-keymap --no-convert $KEYBOARD

local hostname=$INSTALLATION_MOUNTPOINT/etc/hostname

echo $HOST > $hostname
echo >> $hostname

echo root:$ROOTPASS | $chroot chpasswd

$chroot systemctl enable NetworkManager

}

personalization_module
