#!/bin/bash

out "[.] Using device $device"

umount $device?*

out '[.] Writing to disk...'
dd if=$isofile of=$device bs=4M oflag=sync status=progress 2>&3
out '[+] Done'
