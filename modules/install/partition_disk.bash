#!/bin/bash

# IMPORTS:
#   out
#   device : the disk device to format
#
# EXPORTS:
#   boot_partition_disk_device : the device of the boot partition disk
#   boot_partition_number : the boot partition number
#   root_partition_device : the device of the root partition

out "[.] Using device '$device'."

out '[.] Partitioning.'

# TODO mind that if partitions exist this is interactive

(
echo g     # Create a new GPT partition table
echo n     # Create EFI boot partition
echo       # Default number
echo       # Default first sector
echo +512M # Last sector (size)
echo t     # Change type
echo 1     # EFI
echo n     # Create system partition
echo       # Default number
echo       # Default first sector
echo       # Default last sector
echo w     # Write
) | fdisk "$device"

boot_partition_disk_device=$device
boot_partition_number=1
root_partition_device="$device""2"

# Allow kernel to re-sync disks
sleep 1
