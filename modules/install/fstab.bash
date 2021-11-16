#!/bin/bash

# IMPORTS:
#   INSTALLATION_MOUNTPOINT

out '[.] Setting up fstab.'

echo >> $INSTALLATION_MOUNTPOINT/etc/fstab
genfstab -U $INSTALLATION_MOUNTPOINT | sed "s/ *\t/ /g" >> $INSTALLATION_MOUNTPOINT/etc/fstab
