#!/bin/bash

# IMPORTS:
#   INSTALLATION_MOUNTPOINT : mountpoint of the new installation

out '[.] Setting up fstab.'

echo >> $INSTALLER_MOUNTPOINT/etc/fstab
genfstab -U $INSTALLER_MOUNTPOINT | sed "s/ *\t/ /g" >> $INSTALLER_MOUNTPOINT/etc/fstab
