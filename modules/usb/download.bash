#!/bin/bash

# IMPORTS:
#   out
#   MIRROR
#   isofile
#   path
#   sigfile
#   user_stdout

out '[.] Downloading...'

cd ../..

wget "$MIRROR""/""$path""/""$isofile" "https://archlinux.org/""$path""/""$sigfile" --show-progress 2>&$user_stdout

cd modules/usb

out '[+] Downloaded.'
