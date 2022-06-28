#!/bin/bash

# IMPORTS:
# Optionals:
#   DEVICE

# EXPORTS:
#   device : Installation target device

if ! [[ -v DEVICE ]]; then
    devicelist=$(lsblk --nodeps --paths --list --noheadings --sort size --output name,size | grep --extended-regexp --invert-match 'boot|rpmb|loop' | tac)
    device=$(dialog --keep-tite --stdout --menu 'Select installation disk' 0 0 0 ${devicelist}) || exit 1
fi
