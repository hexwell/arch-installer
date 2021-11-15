#!/bin/bash

# IMPORTS:
#   INSTALLATION_MOUNTPOINT : mountpoint of the new installation

out '[.] Setting up fstab.'

echo >> $INSTALLATION_MOUNTPOINT/etc/fstab
genfstab -U $INSTALLATION_MOUNTPOINT | sed "s/ *\t/ /g" >> $INSTALLATION_MOUNTPOINT/etc/fstab
