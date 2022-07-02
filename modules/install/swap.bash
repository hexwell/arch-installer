#!/bin/bash

swap_module() {

# IMPORTS:
#   INSTALLATION_MOUNTPOINT
#   SWAP_SIZE_MiB
#   chroot
#   fstab
#   root_partition_device

# EXPORTS:
#   enable_resume : Set if hibernation is required
#   resume_kernel_params : Resume kernel parameter to enable hibernation

out '[.] Setting up swap...'

local swapfile=/swapfile

dd if=/dev/zero of=$INSTALLATION_MOUNTPOINT$swapfile bs=1M count=$SWAP_SIZE_MiB
$chroot chmod 600 $swapfile
$chroot mkswap $swapfile

echo >> $fstab
echo '# swap' >> $fstab
echo "$swapfile none swap defaults 0 0" >> $fstab
echo >> $fstab

local offset=$($chroot filefrag -v $swapfile | awk '$1=="0:" {print substr($4, 1, length($4)-2)}')

enable_resume=yes
resume_kernel_params=" resume=$root_partition_device resume_offset=$offset"

out '[+] Swap set up.'

}

swap_module
