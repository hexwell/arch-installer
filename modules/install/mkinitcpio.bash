#!/bin/bash

mkinitcpio_module() {

# IMPORTS:
#   INSTALLATION_MOUNTPOINT
#
# Optionals:
#   enable_encryption
#   enable_resume

out '[.] Running mkinitcpio.'

hooks=$(grep '^HOOKS' $INSTALLATION_MOUNTPOINT/etc/mkinitcpio.conf)

add() {
    if ! echo $hooks | grep $1; then
        hooks=$(echo $hooks | sed "s/)/ ""$1"")/")
    fi
}

if [[ -v enable_encryption ]]; then
    add keyboard
    add keymap
    add encrypt
fi

set +e
[[ -v enable_resume ]] && add resume
set -e

sed -i "/^HOOKS/c""$hooks" $INSTALLATION_MOUNTPOINT/etc/mkinitcpio.conf

arch-chroot $INSTALLATION_MOUNTPOINT mkinitcpio -P

}

mkinitcpio_module
