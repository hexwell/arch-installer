#!/bin/bash

mkinitcpio_module() {

# IMPORTS:
#   INSTALLATION_MOUNTPOINT

out '[.] Running mkinitcpio.'

hooks=$(grep '^HOOKS' $INSTALLATION_MOUNTPOINT/etc/mkinitcpio.conf)

add() {
    if ! echo $hooks | grep $1; then
        hooks=$(echo $hooks | sed "s/)/ ""$1"")/")
    fi
}

add keyboard
add keymap
add encrypt
add resume

sed -i "/^HOOKS/c""$hooks" $INSTALLATION_MOUNTPOINT/etc/mkinitcpio.conf

arch-chroot $INSTALLATION_MOUNTPOINT mkinitcpio -P

}

mkinitcpio_module
