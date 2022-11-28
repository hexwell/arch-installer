#!/bin/bash

source conf/usb.bash
source lib/base.bash

# EXPORTS:
#   iso_dir : Directory of the Arch ISO on the server
#   version_delimiter : Delimiter of the Arch ISO filename
#   file_prefix : Prefix of the Arch ISO filename
#   file_postfix : Postfix of the Arch ISO filename
#   path : Path of Arch ISO on the server
#   iso_file  : Arch ISO filename
#   sig_file : Arch ISO signature filename

iso_dir=iso
version_delimiter='-'
file_prefix=archlinux$version_delimiter
file_postfix="$version_delimiter"x86_64.iso

cd modules/usb

source ../check_root.bash
source select_device.bash
source ../confirm_device.bash
source ../check_connection.bash
source get_version.bash

path=$iso_dir/$version
iso_file=$file_prefix$version$file_postfix
sig_file=$iso_file.sig

source download.bash
source verify.bash
source flash.bash

rm ../../$iso_file ../../$sig_file

out '[.] Copying installer...'

if lsblk | grep /mnt; then
    out '[!] /mnt not available.'
    exit 1
fi

source add_partition.bash
source format_and_mount.bash

cp --recursive ../../ /mnt/$REPOSITORY_NAME
umount /mnt

out '[+] USB ready.'
