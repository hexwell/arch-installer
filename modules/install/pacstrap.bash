#!/bin/bash

out '[.] Installing OS...'

ucode=""

if cat /proc/cpuinfo | grep -m 1 GenuineIntel; then
	ucode=intel-ucode
fi

if cat /proc/cpuinfo | grep -m 1 AuthenticAMD; then
	ucode=amd-ucode
fi


network=""

set +u
if [ -v WIFI ]; then
	network="iwd"
fi
set -u

pacstrap $INSTALLER_MOUNTPOINT base linux linux-firmware $ucode $network networkmanager

out '[+] OS installed.'
