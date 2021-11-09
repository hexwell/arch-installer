#!/bin/bash

# TODO edit /etc/mkinitcpio.conf for LUKS

arch-chroot /mnt mkinitcpio -P
