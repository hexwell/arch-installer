#!/bin/bash

pacstrap_module() {

# IMPORTS:
#   INSTALLATION_MOUNTPOINT
#
# Optionals:
#   enable_wifi

# EXPORTS:
#   ucode_kernel_param : Microcode kernel parameter

out '[.] Installing OS...'

set +e

local ucode=""

grep -m 1 GenuineIntel /proc/cpuinfo && local ucode=intel-ucode
grep -m 1 AuthenticAMD /proc/cpuinfo && local ucode=amd-ucode

[[ -z "$ucode" ]] || ucode_kernel_param="initrd=\\""$ucode"".img "


local network=""

[[ -v enable_wifi ]] && local network="$network"" iwd"

set -e


pacstrap $INSTALLATION_MOUNTPOINT base linux linux-firmware $ucode $network networkmanager sudo

out '[+] OS installed.'

}

pacstrap_module
