#!/bin/bash

LOGFILE=log

source conf/usb.bash
source lib/base.bash

DEBUG=false

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

# TODO
exit 0

out '[.] Copying installer...'

if ls /mnt; then
    out '[!] /mnt not available.'
    exit 1
fi

# todo check partition number
mount $device"1" /mnt
cp install.sh /mnt
umount /mnt

out '[+] USB ready.'
