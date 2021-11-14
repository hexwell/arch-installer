#!/bin/bash

set +u
if [ -v DEVICE ]; then
    set -u
    device="$DEVICE"
else
    set -u
    devicelist=$(lsblk -dplnx size -o name,size | grep -Ev "boot|rpmb|loop" | tac)
    device=$(dialog --keep-tite --stdout --menu "Select installation disk" 0 0 0 ${devicelist}) || exit 1
fi

out "[+] Selected '$device'."
read -p "Press enter to continue..." 2>&$user_stdout

# Clear previous line and leave caret there
echo -en "\e[1A\e[K" >&$user_stdout
