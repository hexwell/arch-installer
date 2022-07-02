#!/bin/bash

# IMPORTS:
#   out
#   device
#   iso_file
#   user_stdout

out "[.] Using device $device."

set +e
umount $device?*
set -e

out '[.] Writing to disk...'

cd ../..

dd if=$iso_file of=$device bs=4M oflag=sync status=progress 2>&$user_stdout

cd modules/usb

out '[+] Written.'
