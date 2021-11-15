#!/bin/bash

pacstrap_module() {

# IMPORTS:
#   INSTALLATION_MOUNTPOINT : mountpoint of the new installation
#
# Optionals:
#   WIFI : set if WiFi is required
#
# EXPORTS:
#   ucode_kernel_param

out '[.] Installing OS...'

ucode=""

if cat /proc/cpuinfo | grep -m 1 GenuineIntel; then
	local ucode=intel-ucode
fi

if cat /proc/cpuinfo | grep -m 1 AuthenticAMD; then
	local ucode=amd-ucode
fi

if ! [ -z "$ucode" ]; then
	ucode_kernel_param="initrd=\\""$ucode"".img "
fi


local network=""

set +u
if [ -v WIFI ]; then
	local network="iwd"
fi
set -u


pacstrap $INSTALLATION_MOUNTPOINT base linux linux-firmware $ucode $network networkmanager

out '[+] OS installed.'

}

pacstrap_module
