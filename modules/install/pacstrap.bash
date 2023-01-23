#!/bin/bash

pacstrap_module() {

# IMPORTS:
#   INSTALLATION_MOUNTPOINT

# EXPORTS:
#   ucode_kernel_param : Microcode kernel parameter
#   chroot : chroot command

out '[.] Installing OS...'

identify_cpu() {
	set +e

	grep --max-count 1 $1 /proc/cpuinfo && ucode=$2

	set -e
}

local ucode=''

identify_cpu GenuineIntel intel-ucode
identify_cpu AuthenticAMD amd-ucode

[[ -z $ucode ]] || ucode_kernel_param="initrd=\\$ucode.img "

pacstrap -K $INSTALLATION_MOUNTPOINT base linux linux-firmware $ucode

chroot="arch-chroot $INSTALLATION_MOUNTPOINT"

out '[+] OS installed.'

}

pacstrap_module
