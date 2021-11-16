#!/bin/bash

# IMPORTS:
#   out
#   sigfile

out '[.] Verifing signature...'

cd ../..

set +e
gpg --keyserver hkp://pool.sks-keyservers.net --keyserver-options auto-key-retrieve --verify "$sigfile"

if [ $? -eq 0 ]; then
    out '[+] Valid signature.'
else
    out '[!] Invalid signature.'
    exit 1
fi

set -e

cd modules/usb
