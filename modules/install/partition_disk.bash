#!/bin/bash

# IMPORTS:
#   out
#   device
#
# EXPORTS:
#   boot_partition_disk_device : Device of the boot partition disk
#   boot_partition_number : Boot partition number
#   root_partition_device : Device of the root partition

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
