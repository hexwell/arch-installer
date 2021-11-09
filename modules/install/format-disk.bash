#!/bin/bash

out "[.] Using device $device"

out '[.] Formatting.'

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
) | fdisk $device
