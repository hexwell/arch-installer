#!/bin/bash

arch-chroot /mnt cp -r /boot/. /efi

DEV_UUID="..."

# TODO Add swap file!
# TODO Reorder kernel parameters (refer to EFISTUB, LUKS setup, Swapfile setup)
efibootmgr --disk /dev/sda --part 1 --create --label "arch linux" --loader /vmlinuz-linux --unicode 'cyrptdevice=UUID=$DEV_UUID:cryptroot root=/dev/mapper/cryptroot rw initrd=\intel-ucode.img initrd=\initramfs-linux.img' --verbose
