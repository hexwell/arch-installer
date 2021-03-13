#!/bin/bash

DEBUG=false
LOGFILE=log

# Logging
exec 3>&1 &>$LOGFILE

# u - fail on undeclared variable
# x - echo commands
# o pipefail - fail early in pipelines
set -uxo pipefail

# ------------ CONFIGURATION ------------
# VERSION=2021.02.01
MIRROR=https://archmirror.it
# DEVICE=/dev/sdX
# ------------ ************* ------------

isodir=iso
versiondelimiter='-'
fileprefix="archlinux$versiondelimiter"
filepostfix="$versiondelimiter""x86_64.iso"

if [ "$EUID" -ne 0 ]; then
    echo "[!] Please run as root." >&3
    exit
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

echo "[+] Selected '$device'" >&3
read -p "Press enter to continue..." 2>&3

set +u
if [ -v VERSION ]; then
    set -u
    version=$VERSION
else
    set -u
    echo '[.] Getting version...' >&3
    version=$(curl $MIRROR/$isodir/latest/ | grep -Po "$fileprefix([0-9 | \.]+)$filepostfix" | head -1 | awk -F "$versiondelimiter" '{print $2}')
fi

echo "[+] Using version $version." >&3

path=$isodir/$version
isofile=$fileprefix$version$filepostfix
sigfile=$isofile.sig

echo '[.] Downloading...' >&3
wget $MIRROR/$path/$isofile https://archlinux.org/$path/$sigfile $(if ! $DEBUG; then echo "-q"; fi) --show-progress 2>&3
echo '[+] Downloaded.' >&3

echo '[.] Verifing signature...' >&3
gpg --keyserver hkp://pool.sks-keyservers.net --keyserver-options auto-key-retrieve --verify $sigfile

if [ $? -eq 0 ]; then
    echo '[+] Valid signature.' >&3
else
    echo '[!] Invalid signature.' >&3
    exit 1
fi

echo "[+] Using device $device" >&3

umount $device?*

echo '[.] Writing to disk...' >&3
dd bs=4M if=$isofile of=$device status=progress oflag=sync 2>&3
echo '[+] Done' >&3
