#!/bin/bash

out '[.] Running mkinitcpio.'

hooks=$(cat $INSTALLER_MOUNTPOINT/etc/mkinitcpio.conf | grep '^HOOKS')

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
