#!/bin/bash

bootloader_module() {

# IMPORTS:
#   boot_partition_disk_device : the device of the boot partition disk
#   boot_partition_number : the boot partition number
#   root_partition_device : the device of the root partition
#
# Optionals:
#   encryption_kernel_param
#   ucode_kernel_param
#   swap_kernel_params

out '[.] Setting up bootloader.'

set +u
if ! [ -v encryption_kernel_param ]; then
    local encryption_kernel_param=""
fi
set -u

set +u
if ! [ -v ucode_kernel_param ]; then
    local ucode_kernel_param=""
fi
set -u

set +u
if ! [ -v swap_kernel_params ]; then
    local swap_kernel_params=""
fi
set -u

efibootmgr --disk "$boot_partition_disk_device" --part "$boot_partition_number" --create --label "arch linux" --loader /vmlinuz-linux --unicode "$encryption_kernel_param""root=""$root_partition_device"" rw ""$ucode_kernel_param""initrd=\initramfs-linux.img""$swap_kernel_params" --verbose

}

bootloader_module
