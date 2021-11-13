#!/bin/bash

out '[.] Setting up bootloader.'

DEV_UUID="..."

# TODO Add hibernation parameters (resume=/dev/mapper/cryptroot, resume_offset=TODO) (at the end of current list)!
efibootmgr --disk $device --part 1 --create --label "arch linux" --loader /vmlinuz-linux --unicode "cyrptdevice=UUID="$DEV_UUID":cryptroot root=/dev/mapper/cryptroot rw initrd=\intel-ucode.img initrd=\initramfs-linux.img" --verbose
