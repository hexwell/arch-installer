#!/bin/bash

TZ="Europe/Rome"

arch-chroot /mnt ln -sf /usr/share/zoneinfo/$TZ /etc/localtime
arch-chroot /mnt hwclock --systohc

# TODO edit /etc/locale.gen
arch-chroot /mnt locale-gen

# TODO edit /etc/locale.conf

# TODO edit /etc/vconsole.conf

# TODO edit /etc/hostname

arch-chroot /mnt passwd
