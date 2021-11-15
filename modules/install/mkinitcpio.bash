#!/bin/bash

mkinitcpio_module() {

# IMPORTS:
#   INSTALLATION_MOUNTPOINT : mountpoint of the new installation

out '[.] Running mkinitcpio.'

local hooks=$(cat $INSTALLER_MOUNTPOINT/etc/mkinitcpio.conf | grep '^HOOKS')

add() {
    set +e

    if ! echo $hooks | grep $1; then
        hooks=$(echo $hooks | sed "s/)/ ""$1"")/")
    fi

    set -e
}

add keyboard
add keymap
add encrypt
add resume

sed -i "/^HOOKS/c""$hooks" $INSTALLER_MOUNTPOINT/etc/mkinitcpio.conf

arch-chroot $INSTALLER_MOUNTPOINT mkinitcpio -P

}

mkinitcpio_module
