#!/bin/bash

# IMPORTS:
#   out
#   partition_device

out '[.] Formatting...'

mkfs.ext4 $partition_device
mount $partition_device /mnt

out '[+] Formatted.'
