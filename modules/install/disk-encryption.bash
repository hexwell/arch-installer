#!/bin/bash

# TODO mind that if partitions exist this is interactive.
# TODO maybe don't use STDIN for password input. If you do, you need to delete the log.
# TODO Mind that in the log there's also the wifi pw, so either that has to change or the log has to be deleted anyways.

out '[.] Setting up disk encryption.'
echo -n "$LUKSPW" | cryptsetup -v -d - luksFormat "$device""2"
echo -n "$LUKSPW" | cryptsetup -d - open "$device""2" cryptroot

mkfs.ext4 /dev/mapper/cryptroot
mount /dev/mapper/cryptroot /mnt

# I wanted to mount the ESP to /efi, but in the end I decided to mount it to /boot for the following reasons:
# - It's where kernel packages place the kernel files (and [consequently] where all other programs (e.g. mkinitcpio) expect it to be mounted)
# - It's the officially recomended way when using EFISTUB (https://wiki.archlinux.org/title/EFI_system_partition#Typical_mount_points)
# - It's where one would expect it to be mounted in this type of installation

mkdir /mnt/boot

mkfs.fat -F32 "$device""1"
mount "$device""1" /mnt/boot

out '[+] Disk ready.'
