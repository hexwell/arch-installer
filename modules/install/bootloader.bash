#!/bin/bash

out '[.] Setting up bootloader.'

DEV_UUID=$(blkid -s UUID -o value "$device"2)

# 8192
dd if=/dev/zero of=/mnt/swapfile bs=1M count=512 status=progress
arch-chroot /mnt chmod 600 /swapfile
arch-chroot /mnt mkswap /swapfile
arch-chroot /mnt swapon /swapfile

echo >> /mnt/etc/fstab
echo "# swap" >> /mnt//etc/fstab
echo "/swapfile none swap defaults 0 0" >> /mnt//etc/fstab
echo >> /mnt//etc/fstab

filefrag=$(arch-chroot /mnt filefrag -v /swapfile)

OFFSET=$(echo "$filefrag" | awk '$1=="0:" {print substr($4, 1, length($4)-2)}')

efibootmgr --disk "$device" --part 1 --create --label "arch linux" --loader /vmlinuz-linux --unicode "cryptdevice=UUID=""$DEV_UUID"":cryptroot root=/dev/mapper/cryptroot rw initrd=\intel-ucode.img initrd=\initramfs-linux.img resume=/dev/mapper/cryptroot resume_offset=""$OFFSET" --verbose
