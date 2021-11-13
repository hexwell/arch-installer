#!/bin/bash

# TODO mind that if partitions exist this is interactive.
# TODO don't use STDIN for password input

out '[.] Setting up disk encryption.'
echo -n $LUKSPW | cryptsetup -v -d - luksFormat $device"2"
echo -n $LUKSPW | cryptsetup -d - open $device"2" $DMCRYPTNAME

mkfs.ext4 /dev/mapper/$DMCRYPTNAME
mount /dev/mapper/$DMCRYPTNAME /mnt

mkdir /mnt/boot

mkfs.fat -F32 $device"1"
mount $device"1" /mnt/boot

out '[+] Disk ready.'
