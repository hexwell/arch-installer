#!/bin/bash

format_and_mount_module() {

# IMPORTS:
#   out
#   root_partition_device : the device of the root partition
#   INSTALLATION_MOUNTPOINT : mountpoint of the new installation
#   boot_partition_disk_device : the device of the boot partition disk
#   boot_partition_number : the boot partition number

out '[.] Formatting.'

mkfs.ext4 "$root_partition_device"
mount "$root_partition_device" $INSTALLATION_MOUNTPOINT

# Initially I wanted to mount the ESP to /efi, but then I decided to mount it to /boot for the following reasons:
# - It's where kernel packages place the kernel files (and [consequently] where all other programs (e.g. mkinitcpio) expect it to be mounted)
# - It's the officially recomended way when using EFISTUB (https://wiki.archlinux.org/title/EFI_system_partition#Typical_mount_points)
# - It's where one would expect it to be mounted in this type of installation

mkdir $INSTALLATION_MOUNTPOINT/boot

local boot_partition_device=$boot_partition_disk_device$boot_partition_number

mkfs.fat -F32 "$boot_partition_device"
mount "$boot_partition_device" $INSTALLATION_MOUNTPOINT/boot

}

format_and_mount_module
