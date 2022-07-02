#!/bin/bash

# IMPORTS:
#   USERNAME
#   USERPASS

sed --in-place '/%wheel ALL=(ALL:ALL) ALL/s/^# //' /etc/sudoers

useradd --create-home --groups wheel --shell /bin/bash $USERNAME
echo $USERNAME:$USERPASS | chpasswd
