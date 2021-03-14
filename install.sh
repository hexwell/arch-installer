#!/bin/bash

source base.sh

# Config
source install.config.sh

if [ "$EUID" -ne 0 ]; then
    out "[!] Please run as root."
    exit 1
fi

if ! ls /sys/firmware/efi/efivars; then
    out '[!] Please boot using UEFI.'
    exit 1
fi

loadkeys $KEYBOARD
out "[+] Keyboard set to $KEYBOARD."

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
out -p "Press enter to continue..."

# Internet connection

if $wifi; then
    out '[.] Connecting to WiFi.'
    iwctl --passphrase $WPASS station wlan0 connect $WSSID
fi

ping -c 3 1.1.1.1

out '[+] Connected to the Internet.'

timedatectl set-ntp true
out '[+] Clock set.'

out "[.] Using device $device"

out '[.] Formatting.'

(
echo g     # Create a new GPT partition table
echo n     # Create EFI boot partition
echo       # Default number
echo       # Default first sector
echo +512M # Last sector (size)
echo t     # Change type
echo 1     # EFI
echo n     # Create system partition
echo       # Default number
echo       # Default first sector
echo       # Default last sector
echo w     # Write
) | fdisk $device

out '[.] Setting up disk encryption.'
echo $LUKSPW | cryptsetup -v -d - luksFormat $device"2"
cryptsetup open $device"2" $DMCRYPTNAME
mkfs.ext4 /dev/mapper/$DMCRYPTNAME

mount /dev/mapper/$DMCRYPTNAME /mnt

mkfs.fat -F32 $device"1"
mount $device"1" /mnt/efi

out '[+] Disk ready.'
