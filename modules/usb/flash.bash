#!/bin/bash

# IMPORTS:
#   out
#   device
#   isofile
#   user_stdout

out "[.] Using device $device"

set +e
umount "$device"?*
set -e

out '[.] Writing to disk...'

cd ../..

dd if="$isofile" of="$device" bs=4M oflag=sync status=progress 2>&$user_stdout

cd modules/usb

out '[+] Written.'
