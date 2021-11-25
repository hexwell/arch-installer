#!/bin/bash

pacstrap_module() {

# IMPORTS:
#   INSTALLATION_MOUNTPOINT
#
# Optionals:
#   enable_wifi
#
# EXPORTS:
#   ucode_kernel_param : Microcode kernel parameter

out '[.] Installing OS...'

local ucode=""

if grep -m 1 GenuineIntel /proc/cpuinfo; then
	local ucode=intel-ucode
fi

if grep -m 1 AuthenticAMD /proc/cpuinfo; then
	local ucode=amd-ucode
fi

if ! [[ -z "$ucode" ]]; then
	ucode_kernel_param="initrd=\\""$ucode"".img "
fi


local network=""

set +u
if [[ -v enable_wifi ]]; then
	local network="iwd"
fi
set -u


pacstrap $INSTALLATION_MOUNTPOINT base linux linux-firmware $ucode $network networkmanager

out '[+] OS installed.'

}

pacstrap_module
