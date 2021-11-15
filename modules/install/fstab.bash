#!/bin/bash

out '[.] Setting up fstab.'

echo >> $INSTALLER_MOUNTPOINT/etc/fstab
genfstab -U $INSTALLER_MOUNTPOINT | sed "s/ *\t/ /g" >> $INSTALLER_MOUNTPOINT/etc/fstab
