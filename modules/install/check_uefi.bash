#!/bin/bash

# IMPORTS:
#   out

if ! ls /sys/firmware/efi/efivars; then
    out '[!] Please boot using UEFI.'
    exit 1
fi
