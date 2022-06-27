#!/bin/bash

source conf/usb.bash
source lib/base.bash

# EXPORTS:
#   isodir : Directory of the Arch ISO on the server
#   fileprefix : Prefix of the Arch ISO filename
#   filepostfix : Postfix of the Arch ISO filename
#   versiondelimiter : Delimiter of the Arch ISO filename
#   isofile  : Arch ISO filename
#   path : Path of Arch ISO on the server
#   sigfile : Arch ISO signature filename

isodir=iso
versiondelimiter='-'
fileprefix="archlinux""$versiondelimiter"
filepostfix="$versiondelimiter""x86_64.iso"

cd modules/usb

source ../check_root.bash
source select_device.bash
source ../confirm_device.bash
source get_version.bash

path="$isodir""/""$version"
isofile="$fileprefix""$version""$filepostfix"
sigfile="$isofile.sig"

source download.bash
source verify.bash
source flash.bash

rm ../../$isofile ../../$sigfile

out '[.] Copying installer...'

if lsblk | grep /mnt; then
    out '[!] /mnt not available.'
    exit 1
fi

source add_partition.bash
source format_and_mount.bash

cp --recursive ../../../arch-installer /mnt
umount /mnt

out '[+] USB ready.'
