#!/bin/bash

out '[.] Setting up fstab.'

echo >> /mnt/etc/fstab
genfstab -U /mnt | sed "s/ *\t/ /g" >> /mnt/etc/fstab
