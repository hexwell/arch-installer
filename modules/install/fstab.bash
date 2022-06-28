#!/bin/bash

# IMPORTS:
#   INSTALLATION_MOUNTPOINT

# EXPORTS:
#   fstab : fstab file location

out '[.] Setting up fstab.'

fstab=$INSTALLATION_MOUNTPOINT/etc/fstab

echo >> $fstab
genfstab -U $INSTALLATION_MOUNTPOINT | sed 's/ *\t/ /g' >> $fstab
