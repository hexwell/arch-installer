#!/bin/bash

mkinitcpio_module() {

# IMPORTS:
#   INSTALLATION_MOUNTPOINT
#   chroot
#
# Optionals:
#   enable_encryption
#   enable_resume

out '[.] Running mkinitcpio.'

local mkinitcpio_conf=$INSTALLATION_MOUNTPOINT/etc/mkinitcpio.conf

local hooks=$(grep '^HOOKS' $mkinitcpio_conf)

add() {
    if ! echo $hooks | grep $1; then
        hooks=$(echo $hooks | sed "s/)/ $1)/")
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

sed --in-place "/^HOOKS/c$hooks" $mkinitcpio_conf

$chroot mkinitcpio --allpresets

}

mkinitcpio_module
