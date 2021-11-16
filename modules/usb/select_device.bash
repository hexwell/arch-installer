#!/bin/bash

# IMPORTS:
# Optionals:
#   DEVICE
#
# EXPORTS:
#   device : Installation target device

set +u
if ! [ -v DEVICE ]; then
    set -u
    devicelist=$(lsblk -dplnx size -o name,size | grep -Ev "boot|rpmb|loop" | tac)
    device=$(dialog --keep-tite --stdout --menu "Select installation disk" 0 0 0 ${devicelist}) || exit 1
fi
set -u
