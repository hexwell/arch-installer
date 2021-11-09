#!/bin/bash

# TODO mind that if partitions exist this is interactive.
# TODO don't use STDIN for password input

out '[.] Setting up disk encryption.'
echo $LUKSPW | cryptsetup -v -d - luksFormat $device"2"
cryptsetup open $device"2" $DMCRYPTNAME

mkfs.ext4 /dev/mapper/$DMCRYPTNAME
mount /dev/mapper/$DMCRYPTNAME /mnt

# TODO mkdir /mnt/efi ?

mkfs.fat -F32 $device"1"
mount $device"1" /mnt/efi

out '[+] Disk ready.'
