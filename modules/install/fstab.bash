#!/bin/bash

genfstab -U /mnt >> /mnt/etc/fstab

# TODO some edits to fstab
#   It's mostly good. The root mount certainly is. The ESP mountpoint is WIP/TBD
