#!/bin/bash

out '[.] Setting up bootloader.'

DEV_UUID=$(blkid -s UUID -o value "$device"2)

# 8192
dd if=/dev/zero of=$INSTALLER_MOUNTPOINT/swapfile bs=1M count=512
arch-chroot $INSTALLER_MOUNTPOINT chmod 600 /swapfile
arch-chroot $INSTALLER_MOUNTPOINT mkswap /swapfile

echo >> $INSTALLER_MOUNTPOINT/etc/fstab
echo "# swap" >> $INSTALLER_MOUNTPOINT/etc/fstab
echo "/swapfile none swap defaults 0 0" >> $INSTALLER_MOUNTPOINT/etc/fstab
echo >> $INSTALLER_MOUNTPOINT/etc/fstab

filefrag=$(arch-chroot $INSTALLER_MOUNTPOINT filefrag -v /swapfile)

OFFSET=$(echo "$filefrag" | awk '$1=="0:" {print substr($4, 1, length($4)-2)}')

efibootmgr --disk "$device" --part 1 --create --label "arch linux" --loader /vmlinuz-linux --unicode "cryptdevice=UUID=""$DEV_UUID"":""$DMCRYPTNAME"" root=/dev/mapper/""$DMCRYPTNAME"" rw initrd=\intel-ucode.img initrd=\initramfs-linux.img resume=/dev/mapper/""$DMCRYPTNAME"" resume_offset=""$OFFSET" --verbose
