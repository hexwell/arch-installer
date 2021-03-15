#!/bin/bash

LOGFILE=log

source base.sh

# Config
source usb.config.sh

DEBUG=false

isodir=iso
versiondelimiter='-'
fileprefix="archlinux$versiondelimiter"
filepostfix="$versiondelimiter""x86_64.iso"

if [ "$EUID" -ne 0 ]; then
    out "[!] Please run as root."
    exit 1
fi

set +u
if [ -v DEVICE ]; then
    set -u
    device=$DEVICE
else
    set -u
    devicelist=$(lsblk -dplnx size -o name,size | grep -Ev "boot|rpmb|loop" | tac)
    device=$(dialog --keep-tite --stdout --menu "Select installation disk" 0 0 0 ${devicelist}) || exit 1
fi

out "[+] Selected '$device'"
read -p "Press enter to continue..." 2>&3

set +u
if [ -v VERSION ]; then
    set -u
    version=$VERSION
else
    set -u
    out '[.] Getting version...'
    version=$(curl $MIRROR/$isodir/latest/ | grep -Po "$fileprefix([0-9 | \.]+)$filepostfix" | head -1 | awk -F "$versiondelimiter" '{print $2}')
fi

out "[+] Using version $version."

path=$isodir/$version
isofile=$fileprefix$version$filepostfix
sigfile=$isofile.sig

out '[.] Downloading...'
wget $MIRROR/$path/$isofile https://archlinux.org/$path/$sigfile $(if ! $DEBUG; then echo "-q"; fi) --show-progress 2>&3
out '[+] Downloaded.'

out '[.] Verifing signature...'
set +e
gpg --keyserver hkp://pool.sks-keyservers.net --keyserver-options auto-key-retrieve --verify $sigfile

if [ $? -eq 0 ]; then
    out '[+] Valid signature.'
else
    out '[!] Invalid signature.'
    exit 1
fi
set -e

out "[.] Using device $device"

umount $device?*

out '[.] Writing to disk...'
dd if=$isofile of=$device bs=4M oflag=sync status=progress 2>&3
out '[+] Done'

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
